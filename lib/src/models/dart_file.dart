import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:actor/src/const.dart';
import 'package:actor/src/ext.dart';
import 'package:actor/src/asset_reader.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:collection/collection.dart';
import 'package:actor/src/models/actor.dart';

part 'dart_file.freezed.dart';

/// Represents a Dart file, either main or part.
@freezed
abstract class DartFile with _$DartFile {
  /// A main Dart file.
  const factory DartFile.main({
    required File file,
    required List<Actor> actors,
  }) = MainFile;

  /// A part file.
  const factory DartFile.part({
    required File mainFile,
    required File file,
    required List<Actor> actors,
  }) = PartFile;

  /// Parses a DartFile from a File.
  static Future<DartFile> parse(File file, AssetReader assetReader) async {
    final fileContent = await assetReader.read(file.path);

    final fileParseResult = parseString(content: fileContent, path: file.path);
    final fileAst = fileParseResult.unit;

    final isMain = fileAst.directives.whereType<PartOfDirective>().isEmpty;

    final File fMain;
    if (isMain) {
      fMain = file;
    } else {
      final partOf = fileAst.directives.whereType<PartOfDirective>().first;
      fMain = await partOf.uri!.stringValue
          .toString()
          .file
          .resolveSymbolicLinks()
          .then((v) => v.file);
    }

    final mainFileContent = switch (isMain) {
      true => fileContent,
      false => await assetReader.read(fMain.path),
    };

    final mainParseResult = switch (isMain) {
      true => fileParseResult,
      false => parseString(content: mainFileContent, path: fMain.path),
    };

    final mainAst = switch (isMain) {
      true => fileAst,
      false => mainParseResult.unit,
    };

    final imports = mainAst.directives.whereType<ImportDirective>();

    final actorImport = imports
        .where((imp) => imp.uri.stringValue == Const.importPath)
        .firstOrNull;

    final isImported = actorImport != null;

    final actors = <Actor>[];
    if (isImported) {
      final actorPrefix = actorImport.prefix?.name;
      actors.addAll(fileAst.getActors(fileContent, actorPrefix));
    }

    if (isMain) {
      return DartFile.main(file: file, actors: actors);
    } else {
      return DartFile.part(mainFile: fMain, file: file, actors: actors);
    }
  }
}

extension DartFileX on DartFile {
  /// File for both main and part files.
  File get file => when(
    main: (file, actors) => file,
    part: (mainFile, file, actors) => file,
  );

  /// Actors list for both main and part files.
  List<Actor> get actors => when(
    main: (file, actors) => actors,
    part: (mainFile, file, actors) => actors,
  );
}

extension CompilationUnitX on CompilationUnit {
  /// Extracts all actor functions from this compilation unit.
  Iterable<Actor> getActors(String fileContent, [String? prefix]) sync* {
    final expectedAnnoName = switch (prefix) {
      null => Const.annotationName,
      String v => "$v.${Const.annotationName}",
    };

    final methods = declarations.whereType<FunctionDeclaration>();

    final actorMethods = <FunctionDeclaration>[];

    for (final method in methods) {
      for (final anonotation in method.metadata) {
        final name = anonotation.name.name;
        if (name == expectedAnnoName) {
          actorMethods.add(method);
          break;
        }
      }
    }

    for (final method in actorMethods) {
      final methodName = method.name.value().toString();
      final isPrivate = methodName.startsWith("_");

      if (isPrivate) continue;

      final isAsync = switch (method.returnType) {
        NamedType v => v.type?.isDartAsyncFuture ?? false,
        _ => false,
      };

      final requireContext =
          (method.functionExpression.parameters?.parameters.length ?? 0) >= 1;

      final offset = method.returnType?.offset ?? 0;

      final lineNumber = fileContent.substring(0, offset).split('\n').length;
      final columnNumber =
          offset - fileContent.substring(0, offset).lastIndexOf('\n');

      yield Actor(
        functionName: methodName,
        isAsync: isAsync,
        requireContext: requireContext,
        lineNumber: lineNumber,
        columnNumber: columnNumber,
      );
    }
  }
}
