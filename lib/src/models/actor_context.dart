import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:actor/src/models/mode.dart';

part 'actor_context.freezed.dart';

/// Context passed to actor functions when they require context.
@freezed
abstract class ActorContext with _$ActorContext {
  /// Creates an ActorContext with the given parameters.
  const factory ActorContext({
    required Mode mode,
    required File file,
    required Directory root,
  }) = _ActorContext;

  const ActorContext._();

  /// Directory containing the file.
  Directory get dir => file.parent;
}

/// Type alias for ActorContext.
typedef C = ActorContext;
