// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'characters_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CharactersState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharactersState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CharactersState()';
}


}

/// @nodoc
class $CharactersStateCopyWith<$Res>  {
$CharactersStateCopyWith(CharactersState _, $Res Function(CharactersState) __);
}


/// Adds pattern-matching-related methods to [CharactersState].
extension CharactersStatePatterns on CharactersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( CharactersLoading value)?  charactersLoading,TResult Function( _CharactersLoadingMore value)?  charactersLoadingMore,TResult Function( CharactersSuccess value)?  charactersSuccess,TResult Function( CharactersError value)?  charactersError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CharactersLoading() when charactersLoading != null:
return charactersLoading(_that);case _CharactersLoadingMore() when charactersLoadingMore != null:
return charactersLoadingMore(_that);case CharactersSuccess() when charactersSuccess != null:
return charactersSuccess(_that);case CharactersError() when charactersError != null:
return charactersError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( CharactersLoading value)  charactersLoading,required TResult Function( _CharactersLoadingMore value)  charactersLoadingMore,required TResult Function( CharactersSuccess value)  charactersSuccess,required TResult Function( CharactersError value)  charactersError,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case CharactersLoading():
return charactersLoading(_that);case _CharactersLoadingMore():
return charactersLoadingMore(_that);case CharactersSuccess():
return charactersSuccess(_that);case CharactersError():
return charactersError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( CharactersLoading value)?  charactersLoading,TResult? Function( _CharactersLoadingMore value)?  charactersLoadingMore,TResult? Function( CharactersSuccess value)?  charactersSuccess,TResult? Function( CharactersError value)?  charactersError,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case CharactersLoading() when charactersLoading != null:
return charactersLoading(_that);case _CharactersLoadingMore() when charactersLoadingMore != null:
return charactersLoadingMore(_that);case CharactersSuccess() when charactersSuccess != null:
return charactersSuccess(_that);case CharactersError() when charactersError != null:
return charactersError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  charactersLoading,TResult Function( List<CharacterModel> characters)?  charactersLoadingMore,TResult Function( List<CharacterModel> characters)?  charactersSuccess,TResult Function( String error)?  charactersError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CharactersLoading() when charactersLoading != null:
return charactersLoading();case _CharactersLoadingMore() when charactersLoadingMore != null:
return charactersLoadingMore(_that.characters);case CharactersSuccess() when charactersSuccess != null:
return charactersSuccess(_that.characters);case CharactersError() when charactersError != null:
return charactersError(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  charactersLoading,required TResult Function( List<CharacterModel> characters)  charactersLoadingMore,required TResult Function( List<CharacterModel> characters)  charactersSuccess,required TResult Function( String error)  charactersError,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case CharactersLoading():
return charactersLoading();case _CharactersLoadingMore():
return charactersLoadingMore(_that.characters);case CharactersSuccess():
return charactersSuccess(_that.characters);case CharactersError():
return charactersError(_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  charactersLoading,TResult? Function( List<CharacterModel> characters)?  charactersLoadingMore,TResult? Function( List<CharacterModel> characters)?  charactersSuccess,TResult? Function( String error)?  charactersError,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case CharactersLoading() when charactersLoading != null:
return charactersLoading();case _CharactersLoadingMore() when charactersLoadingMore != null:
return charactersLoadingMore(_that.characters);case CharactersSuccess() when charactersSuccess != null:
return charactersSuccess(_that.characters);case CharactersError() when charactersError != null:
return charactersError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements CharactersState {
   _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CharactersState.initial()';
}


}




/// @nodoc


class CharactersLoading implements CharactersState {
   CharactersLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharactersLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CharactersState.charactersLoading()';
}


}




/// @nodoc


class _CharactersLoadingMore implements CharactersState {
   _CharactersLoadingMore({required final  List<CharacterModel> characters}): _characters = characters;
  

 final  List<CharacterModel> _characters;
 List<CharacterModel> get characters {
  if (_characters is EqualUnmodifiableListView) return _characters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_characters);
}


/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CharactersLoadingMoreCopyWith<_CharactersLoadingMore> get copyWith => __$CharactersLoadingMoreCopyWithImpl<_CharactersLoadingMore>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CharactersLoadingMore&&const DeepCollectionEquality().equals(other._characters, _characters));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_characters));

@override
String toString() {
  return 'CharactersState.charactersLoadingMore(characters: $characters)';
}


}

/// @nodoc
abstract mixin class _$CharactersLoadingMoreCopyWith<$Res> implements $CharactersStateCopyWith<$Res> {
  factory _$CharactersLoadingMoreCopyWith(_CharactersLoadingMore value, $Res Function(_CharactersLoadingMore) _then) = __$CharactersLoadingMoreCopyWithImpl;
@useResult
$Res call({
 List<CharacterModel> characters
});




}
/// @nodoc
class __$CharactersLoadingMoreCopyWithImpl<$Res>
    implements _$CharactersLoadingMoreCopyWith<$Res> {
  __$CharactersLoadingMoreCopyWithImpl(this._self, this._then);

  final _CharactersLoadingMore _self;
  final $Res Function(_CharactersLoadingMore) _then;

/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? characters = null,}) {
  return _then(_CharactersLoadingMore(
characters: null == characters ? _self._characters : characters // ignore: cast_nullable_to_non_nullable
as List<CharacterModel>,
  ));
}


}

/// @nodoc


class CharactersSuccess implements CharactersState {
   CharactersSuccess({required final  List<CharacterModel> characters}): _characters = characters;
  

 final  List<CharacterModel> _characters;
 List<CharacterModel> get characters {
  if (_characters is EqualUnmodifiableListView) return _characters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_characters);
}


/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharactersSuccessCopyWith<CharactersSuccess> get copyWith => _$CharactersSuccessCopyWithImpl<CharactersSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharactersSuccess&&const DeepCollectionEquality().equals(other._characters, _characters));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_characters));

@override
String toString() {
  return 'CharactersState.charactersSuccess(characters: $characters)';
}


}

/// @nodoc
abstract mixin class $CharactersSuccessCopyWith<$Res> implements $CharactersStateCopyWith<$Res> {
  factory $CharactersSuccessCopyWith(CharactersSuccess value, $Res Function(CharactersSuccess) _then) = _$CharactersSuccessCopyWithImpl;
@useResult
$Res call({
 List<CharacterModel> characters
});




}
/// @nodoc
class _$CharactersSuccessCopyWithImpl<$Res>
    implements $CharactersSuccessCopyWith<$Res> {
  _$CharactersSuccessCopyWithImpl(this._self, this._then);

  final CharactersSuccess _self;
  final $Res Function(CharactersSuccess) _then;

/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? characters = null,}) {
  return _then(CharactersSuccess(
characters: null == characters ? _self._characters : characters // ignore: cast_nullable_to_non_nullable
as List<CharacterModel>,
  ));
}


}

/// @nodoc


class CharactersError implements CharactersState {
   CharactersError(this.error);
  

 final  String error;

/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CharactersErrorCopyWith<CharactersError> get copyWith => _$CharactersErrorCopyWithImpl<CharactersError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CharactersError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'CharactersState.charactersError(error: $error)';
}


}

/// @nodoc
abstract mixin class $CharactersErrorCopyWith<$Res> implements $CharactersStateCopyWith<$Res> {
  factory $CharactersErrorCopyWith(CharactersError value, $Res Function(CharactersError) _then) = _$CharactersErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$CharactersErrorCopyWithImpl<$Res>
    implements $CharactersErrorCopyWith<$Res> {
  _$CharactersErrorCopyWithImpl(this._self, this._then);

  final CharactersError _self;
  final $Res Function(CharactersError) _then;

/// Create a copy of CharactersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CharactersError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
