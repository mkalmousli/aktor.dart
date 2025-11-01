import 'dart:io';

import 'package:actor/src/models/actor.dart';
import 'package:actor/src/models/dart_file.dart';
import 'package:actor/src/models/mode.dart';
import 'package:actor/src/actor_runner/bloc.dart' as b_actor_runner;
import 'package:actor/src/actor_runner/state.dart' as s_actor_runner;
import 'package:actor/src/asset_reader.dart';
import 'package:actor/src/ext.dart';
import 'package:actor/version.dart';
import 'package:ansi/ansi.dart';
import 'package:collection/collection.dart';

/// Runs the actor CLI with the given command-line arguments.
Future<int> runCli(List<String> args) async {
  final devFlags = {"-d", "--dev"};

  final actionsArgs = args
      .where((arg) => arg.startsWith("-") || arg.startsWith("--"))
      .toList();
  final pathArgs = args.where((arg) => !actionsArgs.contains(arg)).toList();

  if (actionsArgs.contains("-v") || actionsArgs.contains("--version")) {
    stdout.writeln(green("You are using actor version ${version}"));
    return 0;
  }

  final Mode mode;
  if (devFlags.any(actionsArgs.contains)) {
    mode = Mode.dev;
  } else {
    mode = Mode.prod;
  }

  stdout.writeln(blue("Mode: ${mode.name}"));

  final dCurrent = Directory.current;

  final Directory dInput;
  if (pathArgs.isEmpty) {
    dInput = dCurrent;
  } else {
    dInput = Directory(pathArgs.first);
  }

  final Directory dRoot = await () async {
    Directory dir = dCurrent;

    while (true) {
      if (await dir.f("pubspec.yaml").exists()) {
        return dir;
      }

      dir = dir.parent;
      if (dir.path == dCurrent.path) break;
    }

    throw Exception("Couldn't find root package folder!");
  }();

  /// Recursively scans for Dart files, ignoring build directories.
  Stream<File> getInputFiles(Directory dir) async* {
    await for (final entity in dir.list()) {
      if (entity is File) {
        if (entity.name.endsWith(".dart")) {
          yield entity;
        }
      } else if (entity is Directory) {
        final isExcluded = [
          ".dart_tool",
          ".dyn",
          "build",
        ].any((name) => entity.name == name);
        if (isExcluded) continue;

        yield* getInputFiles(entity);
      }
    }
  }

  final allDartFiles = <DartFile>{};
  final actorRunners = <b_actor_runner.ActorRunner>{};

  /// Creates and starts a runner for the given actor.
  Future<void> runActor(Actor actor, DartFile dartFile) async {
    final runner = b_actor_runner.ActorRunner(
      actor: actor,
      dartFile: dartFile,
      dRoot: dRoot,
      initialState: s_actor_runner.State.initial(),
    );
    actorRunners.add(runner);
    await runner.start(mode);
  }

  /// Processes a Dart file, managing actors as they're added or removed.
  Future<void> processDartFile(DartFile dartFile) async {
    final oldDartFile = allDartFiles.firstWhereOrNull(
      (df) => df.file.path == dartFile.file.path,
    );
    allDartFiles.remove(oldDartFile);

    final isNew = oldDartFile == null;

    final newActors = <Actor>{};
    final removedActors = <Actor>{};

    if (isNew) {
      newActors.addAll(dartFile.actors);
    } else {
      newActors.addAll(
        dartFile.actors.where((a) => !oldDartFile.actors.any((oa) => oa == a)),
      );
      removedActors.addAll(
        oldDartFile.actors.where((a) => !dartFile.actors.any((oa) => oa == a)),
      );
    }

    for (final actor in newActors) {
      await runActor(actor, dartFile);
    }

    for (final actor in removedActors) {
      final runner = actorRunners.firstWhereOrNull(
        (r) =>
            r.actor.functionName == actor.functionName &&
            r.dartFile.file.path == dartFile.file.path &&
            r.dRoot.path == dRoot.path,
      );
      await runner?.stop();
      actorRunners.remove(runner);
    }

    allDartFiles.add(dartFile);
  }

  int iCycle = 0;

  /// Processes all Dart files in the input directory.
  Future<void> processFiles() async {
    iCycle += 1;
    final isFirstCycle = iCycle == 1;

    if (actorRunners.isEmpty) {
      stdout.writeln(yellow("Searching for actors..."));
    }

    final assetReader = AssetReader();
    await for (final file in getInputFiles(dInput)) {
      DartFile? dartFile;
      try {
        dartFile = await DartFile.parse(file, assetReader);
      } catch (_) {}

      if (dartFile == null) continue;
      await processDartFile(dartFile);
    }

    if (isFirstCycle && actorRunners.isEmpty) {
      stdout.writeln(yellow("No actors found."));
    }
  }

  await processFiles();

  if (mode == Mode.dev) {
    await for (final _ in dInput.watch()) {
      await processFiles();
    }
  }

  for (final ar in actorRunners) {
    await ar.wait();
  }

  stdout.writeln(green("Done!"));

  return 0;
}
