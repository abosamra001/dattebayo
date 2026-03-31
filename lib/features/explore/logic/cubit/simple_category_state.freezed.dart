// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simple_category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SimpleCategoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimpleCategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SimpleCategoryState()';
}


}

/// @nodoc
class $SimpleCategoryStateCopyWith<$Res>  {
$SimpleCategoryStateCopyWith(SimpleCategoryState _, $Res Function(SimpleCategoryState) __);
}


/// Adds pattern-matching-related methods to [SimpleCategoryState].
extension SimpleCategoryStatePatterns on SimpleCategoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( SimpleLoading value)?  simpleLoading,TResult Function( SimpleSuccess value)?  simpleSuccess,TResult Function( SimpleError value)?  simpleError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SimpleLoading() when simpleLoading != null:
return simpleLoading(_that);case SimpleSuccess() when simpleSuccess != null:
return simpleSuccess(_that);case SimpleError() when simpleError != null:
return simpleError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( SimpleLoading value)  simpleLoading,required TResult Function( SimpleSuccess value)  simpleSuccess,required TResult Function( SimpleError value)  simpleError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case SimpleLoading():
return simpleLoading(_that);case SimpleSuccess():
return simpleSuccess(_that);case SimpleError():
return simpleError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( SimpleLoading value)?  simpleLoading,TResult? Function( SimpleSuccess value)?  simpleSuccess,TResult? Function( SimpleError value)?  simpleError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case SimpleLoading() when simpleLoading != null:
return simpleLoading(_that);case SimpleSuccess() when simpleSuccess != null:
return simpleSuccess(_that);case SimpleError() when simpleError != null:
return simpleError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  simpleLoading,TResult Function( List<SimpleCategoryModel> data)?  simpleSuccess,TResult Function( String error)?  simpleError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SimpleLoading() when simpleLoading != null:
return simpleLoading();case SimpleSuccess() when simpleSuccess != null:
return simpleSuccess(_that.data);case SimpleError() when simpleError != null:
return simpleError(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  simpleLoading,required TResult Function( List<SimpleCategoryModel> data)  simpleSuccess,required TResult Function( String error)  simpleError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case SimpleLoading():
return simpleLoading();case SimpleSuccess():
return simpleSuccess(_that.data);case SimpleError():
return simpleError(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  simpleLoading,TResult? Function( List<SimpleCategoryModel> data)?  simpleSuccess,TResult? Function( String error)?  simpleError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case SimpleLoading() when simpleLoading != null:
return simpleLoading();case SimpleSuccess() when simpleSuccess != null:
return simpleSuccess(_that.data);case SimpleError() when simpleError != null:
return simpleError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SimpleCategoryState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SimpleCategoryState.initial()';
}


}




/// @nodoc


class SimpleLoading implements SimpleCategoryState {
  const SimpleLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimpleLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SimpleCategoryState.simpleLoading()';
}


}




/// @nodoc


class SimpleSuccess implements SimpleCategoryState {
  const SimpleSuccess({required final  List<SimpleCategoryModel> data}): _data = data;
  

 final  List<SimpleCategoryModel> _data;
 List<SimpleCategoryModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of SimpleCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SimpleSuccessCopyWith<SimpleSuccess> get copyWith => _$SimpleSuccessCopyWithImpl<SimpleSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimpleSuccess&&const DeepCollectionEquality().equals(other._data, _data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SimpleCategoryState.simpleSuccess(data: $data)';
}


}

/// @nodoc
abstract mixin class $SimpleSuccessCopyWith<$Res> implements $SimpleCategoryStateCopyWith<$Res> {
  factory $SimpleSuccessCopyWith(SimpleSuccess value, $Res Function(SimpleSuccess) _then) = _$SimpleSuccessCopyWithImpl;
@useResult
$Res call({
 List<SimpleCategoryModel> data
});




}
/// @nodoc
class _$SimpleSuccessCopyWithImpl<$Res>
    implements $SimpleSuccessCopyWith<$Res> {
  _$SimpleSuccessCopyWithImpl(this._self, this._then);

  final SimpleSuccess _self;
  final $Res Function(SimpleSuccess) _then;

/// Create a copy of SimpleCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(SimpleSuccess(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SimpleCategoryModel>,
  ));
}


}

/// @nodoc


class SimpleError implements SimpleCategoryState {
  const SimpleError(this.error);
  

 final  String error;

/// Create a copy of SimpleCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SimpleErrorCopyWith<SimpleError> get copyWith => _$SimpleErrorCopyWithImpl<SimpleError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimpleError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SimpleCategoryState.simpleError(error: $error)';
}


}

/// @nodoc
abstract mixin class $SimpleErrorCopyWith<$Res> implements $SimpleCategoryStateCopyWith<$Res> {
  factory $SimpleErrorCopyWith(SimpleError value, $Res Function(SimpleError) _then) = _$SimpleErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$SimpleErrorCopyWithImpl<$Res>
    implements $SimpleErrorCopyWith<$Res> {
  _$SimpleErrorCopyWithImpl(this._self, this._then);

  final SimpleError _self;
  final $Res Function(SimpleError) _then;

/// Create a copy of SimpleCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SimpleError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
