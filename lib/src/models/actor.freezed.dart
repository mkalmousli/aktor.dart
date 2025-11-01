// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'actor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Actor {

///
/// The function name.
///
 String get functionName;///
/// The line number where the function is located on.
///
 int get lineNumber;///
/// The column number where the function is located on.
///
 int get columnNumber;///
/// Whether the method is asynchronous.
///
 bool get isAsync;///
/// Whether the method requires a context.
///
 bool get requireContext;
/// Create a copy of Actor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActorCopyWith<Actor> get copyWith => _$ActorCopyWithImpl<Actor>(this as Actor, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Actor&&(identical(other.functionName, functionName) || other.functionName == functionName)&&(identical(other.lineNumber, lineNumber) || other.lineNumber == lineNumber)&&(identical(other.columnNumber, columnNumber) || other.columnNumber == columnNumber)&&(identical(other.isAsync, isAsync) || other.isAsync == isAsync)&&(identical(other.requireContext, requireContext) || other.requireContext == requireContext));
}


@override
int get hashCode => Object.hash(runtimeType,functionName,lineNumber,columnNumber,isAsync,requireContext);

@override
String toString() {
  return 'Actor(functionName: $functionName, lineNumber: $lineNumber, columnNumber: $columnNumber, isAsync: $isAsync, requireContext: $requireContext)';
}


}

/// @nodoc
abstract mixin class $ActorCopyWith<$Res>  {
  factory $ActorCopyWith(Actor value, $Res Function(Actor) _then) = _$ActorCopyWithImpl;
@useResult
$Res call({
 String functionName, int lineNumber, int columnNumber, bool isAsync, bool requireContext
});




}
/// @nodoc
class _$ActorCopyWithImpl<$Res>
    implements $ActorCopyWith<$Res> {
  _$ActorCopyWithImpl(this._self, this._then);

  final Actor _self;
  final $Res Function(Actor) _then;

/// Create a copy of Actor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? functionName = null,Object? lineNumber = null,Object? columnNumber = null,Object? isAsync = null,Object? requireContext = null,}) {
  return _then(_self.copyWith(
functionName: null == functionName ? _self.functionName : functionName // ignore: cast_nullable_to_non_nullable
as String,lineNumber: null == lineNumber ? _self.lineNumber : lineNumber // ignore: cast_nullable_to_non_nullable
as int,columnNumber: null == columnNumber ? _self.columnNumber : columnNumber // ignore: cast_nullable_to_non_nullable
as int,isAsync: null == isAsync ? _self.isAsync : isAsync // ignore: cast_nullable_to_non_nullable
as bool,requireContext: null == requireContext ? _self.requireContext : requireContext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Actor].
extension ActorPatterns on Actor {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Actor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Actor() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Actor value)  $default,){
final _that = this;
switch (_that) {
case _Actor():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Actor value)?  $default,){
final _that = this;
switch (_that) {
case _Actor() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String functionName,  int lineNumber,  int columnNumber,  bool isAsync,  bool requireContext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Actor() when $default != null:
return $default(_that.functionName,_that.lineNumber,_that.columnNumber,_that.isAsync,_that.requireContext);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String functionName,  int lineNumber,  int columnNumber,  bool isAsync,  bool requireContext)  $default,) {final _that = this;
switch (_that) {
case _Actor():
return $default(_that.functionName,_that.lineNumber,_that.columnNumber,_that.isAsync,_that.requireContext);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String functionName,  int lineNumber,  int columnNumber,  bool isAsync,  bool requireContext)?  $default,) {final _that = this;
switch (_that) {
case _Actor() when $default != null:
return $default(_that.functionName,_that.lineNumber,_that.columnNumber,_that.isAsync,_that.requireContext);case _:
  return null;

}
}

}

/// @nodoc


class _Actor implements Actor {
  const _Actor({required this.functionName, required this.lineNumber, required this.columnNumber, this.isAsync = false, this.requireContext = false});
  

///
/// The function name.
///
@override final  String functionName;
///
/// The line number where the function is located on.
///
@override final  int lineNumber;
///
/// The column number where the function is located on.
///
@override final  int columnNumber;
///
/// Whether the method is asynchronous.
///
@override@JsonKey() final  bool isAsync;
///
/// Whether the method requires a context.
///
@override@JsonKey() final  bool requireContext;

/// Create a copy of Actor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActorCopyWith<_Actor> get copyWith => __$ActorCopyWithImpl<_Actor>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Actor&&(identical(other.functionName, functionName) || other.functionName == functionName)&&(identical(other.lineNumber, lineNumber) || other.lineNumber == lineNumber)&&(identical(other.columnNumber, columnNumber) || other.columnNumber == columnNumber)&&(identical(other.isAsync, isAsync) || other.isAsync == isAsync)&&(identical(other.requireContext, requireContext) || other.requireContext == requireContext));
}


@override
int get hashCode => Object.hash(runtimeType,functionName,lineNumber,columnNumber,isAsync,requireContext);

@override
String toString() {
  return 'Actor(functionName: $functionName, lineNumber: $lineNumber, columnNumber: $columnNumber, isAsync: $isAsync, requireContext: $requireContext)';
}


}

/// @nodoc
abstract mixin class _$ActorCopyWith<$Res> implements $ActorCopyWith<$Res> {
  factory _$ActorCopyWith(_Actor value, $Res Function(_Actor) _then) = __$ActorCopyWithImpl;
@override @useResult
$Res call({
 String functionName, int lineNumber, int columnNumber, bool isAsync, bool requireContext
});




}
/// @nodoc
class __$ActorCopyWithImpl<$Res>
    implements _$ActorCopyWith<$Res> {
  __$ActorCopyWithImpl(this._self, this._then);

  final _Actor _self;
  final $Res Function(_Actor) _then;

/// Create a copy of Actor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? functionName = null,Object? lineNumber = null,Object? columnNumber = null,Object? isAsync = null,Object? requireContext = null,}) {
  return _then(_Actor(
functionName: null == functionName ? _self.functionName : functionName // ignore: cast_nullable_to_non_nullable
as String,lineNumber: null == lineNumber ? _self.lineNumber : lineNumber // ignore: cast_nullable_to_non_nullable
as int,columnNumber: null == columnNumber ? _self.columnNumber : columnNumber // ignore: cast_nullable_to_non_nullable
as int,isAsync: null == isAsync ? _self.isAsync : isAsync // ignore: cast_nullable_to_non_nullable
as bool,requireContext: null == requireContext ? _self.requireContext : requireContext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
