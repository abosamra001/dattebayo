// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkState()';
}


}

/// @nodoc
class $NetworkStateCopyWith<$Res>  {
$NetworkStateCopyWith(NetworkState _, $Res Function(NetworkState) __);
}


/// Adds pattern-matching-related methods to [NetworkState].
extension NetworkStatePatterns on NetworkState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( NetworkConnected value)?  connected,TResult Function( NetworkDisconnected value)?  disConnected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case NetworkConnected() when connected != null:
return connected(_that);case NetworkDisconnected() when disConnected != null:
return disConnected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( NetworkConnected value)  connected,required TResult Function( NetworkDisconnected value)  disConnected,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case NetworkConnected():
return connected(_that);case NetworkDisconnected():
return disConnected(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( NetworkConnected value)?  connected,TResult? Function( NetworkDisconnected value)?  disConnected,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case NetworkConnected() when connected != null:
return connected(_that);case NetworkDisconnected() when disConnected != null:
return disConnected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  connected,TResult Function()?  disConnected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case NetworkConnected() when connected != null:
return connected();case NetworkDisconnected() when disConnected != null:
return disConnected();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  connected,required TResult Function()  disConnected,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case NetworkConnected():
return connected();case NetworkDisconnected():
return disConnected();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  connected,TResult? Function()?  disConnected,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case NetworkConnected() when connected != null:
return connected();case NetworkDisconnected() when disConnected != null:
return disConnected();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements NetworkState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkState.initial()';
}


}




/// @nodoc


class NetworkConnected implements NetworkState {
  const NetworkConnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkConnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkState.connected()';
}


}




/// @nodoc


class NetworkDisconnected implements NetworkState {
  const NetworkDisconnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkDisconnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkState.disConnected()';
}


}




// dart format on
