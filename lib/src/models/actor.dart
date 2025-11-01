import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor.freezed.dart';

@freezed
abstract class Actor with _$Actor {
  const factory Actor({
    /// Function name.
    required String functionName,

    /// Line number where the function is located.
    required int lineNumber,

    /// Column number where the function is located.
    required int columnNumber,

    /// Whether the method is asynchronous.
    @Default(false) bool isAsync,

    /// Whether the method requires a context.
    @Default(false) bool requireContext,
  }) = _Actor;
}
