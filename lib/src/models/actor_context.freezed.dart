// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'actor_context.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ActorContext {

 Mode get mode; File get file; Directory get root;
/// Create a copy of ActorContext
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActorContextCopyWith<ActorContext> get copyWith => _$ActorContextCopyWithImpl<ActorContext>(this as ActorContext, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActorContext&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.file, file) || other.file == file)&&(identical(other.root, root) || other.root == root));
}


@override
int get hashCode => Object.hash(runtimeType,mode,file,root);

@override
String toString() {
  return 'ActorContext(mode: $mode, file: $file, root: $root)';
}


}

/// @nodoc
abstract mixin class $ActorContextCopyWith<$Res>  {
  factory $ActorContextCopyWith(ActorContext value, $Res Function(ActorContext) _then) = _$ActorContextCopyWithImpl;
@useResult
$Res call({
 Mode mode, File file, Directory root
});




}
/// @nodoc
class _$ActorContextCopyWithImpl<$Res>
    implements $ActorContextCopyWith<$Res> {
  _$ActorContextCopyWithImpl(this._self, this._then);

  final ActorContext _self;
  final $Res Function(ActorContext) _then;

/// Create a copy of ActorContext
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mode = null,Object? file = null,Object? root = null,}) {
  return _then(_self.copyWith(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as Mode,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,root: null == root ? _self.root : root // ignore: cast_nullable_to_non_nullable
as Directory,
  ));
}

}


/// Adds pattern-matching-related methods to [ActorContext].
extension ActorContextPatterns on ActorContext {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ActorContext value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ActorContext() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ActorContext value)  $default,){
final _that = this;
switch (_that) {
case _ActorContext():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ActorContext value)?  $default,){
final _that = this;
switch (_that) {
case _ActorContext() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Mode mode,  File file,  Directory root)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ActorContext() when $default != null:
return $default(_that.mode,_that.file,_that.root);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Mode mode,  File file,  Directory root)  $default,) {final _that = this;
switch (_that) {
case _ActorContext():
return $default(_that.mode,_that.file,_that.root);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Mode mode,  File file,  Directory root)?  $default,) {final _that = this;
switch (_that) {
case _ActorContext() when $default != null:
return $default(_that.mode,_that.file,_that.root);case _:
  return null;

}
}

}

/// @nodoc


class _ActorContext extends ActorContext {
  const _ActorContext({required this.mode, required this.file, required this.root}): super._();
  

@override final  Mode mode;
@override final  File file;
@override final  Directory root;

/// Create a copy of ActorContext
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ActorContextCopyWith<_ActorContext> get copyWith => __$ActorContextCopyWithImpl<_ActorContext>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ActorContext&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.file, file) || other.file == file)&&(identical(other.root, root) || other.root == root));
}


@override
int get hashCode => Object.hash(runtimeType,mode,file,root);

@override
String toString() {
  return 'ActorContext(mode: $mode, file: $file, root: $root)';
}


}

/// @nodoc
abstract mixin class _$ActorContextCopyWith<$Res> implements $ActorContextCopyWith<$Res> {
  factory _$ActorContextCopyWith(_ActorContext value, $Res Function(_ActorContext) _then) = __$ActorContextCopyWithImpl;
@override @useResult
$Res call({
 Mode mode, File file, Directory root
});




}
/// @nodoc
class __$ActorContextCopyWithImpl<$Res>
    implements _$ActorContextCopyWith<$Res> {
  __$ActorContextCopyWithImpl(this._self, this._then);

  final _ActorContext _self;
  final $Res Function(_ActorContext) _then;

/// Create a copy of ActorContext
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mode = null,Object? file = null,Object? root = null,}) {
  return _then(_ActorContext(
mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as Mode,file: null == file ? _self.file : file // ignore: cast_nullable_to_non_nullable
as File,root: null == root ? _self.root : root // ignore: cast_nullable_to_non_nullable
as Directory,
  ));
}


}

// dart format on
