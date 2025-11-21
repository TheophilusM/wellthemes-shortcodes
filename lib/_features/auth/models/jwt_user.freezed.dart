// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jwt_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JwtUser {

 String get email; String get fullName; String get country; List<String> get roles; bool get mfaEnabled; int get userId;
/// Create a copy of JwtUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JwtUserCopyWith<JwtUser> get copyWith => _$JwtUserCopyWithImpl<JwtUser>(this as JwtUser, _$identity);

  /// Serializes this JwtUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JwtUser&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other.roles, roles)&&(identical(other.mfaEnabled, mfaEnabled) || other.mfaEnabled == mfaEnabled)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,fullName,country,const DeepCollectionEquality().hash(roles),mfaEnabled,userId);

@override
String toString() {
  return 'JwtUser(email: $email, fullName: $fullName, country: $country, roles: $roles, mfaEnabled: $mfaEnabled, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $JwtUserCopyWith<$Res>  {
  factory $JwtUserCopyWith(JwtUser value, $Res Function(JwtUser) _then) = _$JwtUserCopyWithImpl;
@useResult
$Res call({
 String email, String fullName, String country, List<String> roles, bool mfaEnabled, int userId
});




}
/// @nodoc
class _$JwtUserCopyWithImpl<$Res>
    implements $JwtUserCopyWith<$Res> {
  _$JwtUserCopyWithImpl(this._self, this._then);

  final JwtUser _self;
  final $Res Function(JwtUser) _then;

/// Create a copy of JwtUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? fullName = null,Object? country = null,Object? roles = null,Object? mfaEnabled = null,Object? userId = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,mfaEnabled: null == mfaEnabled ? _self.mfaEnabled : mfaEnabled // ignore: cast_nullable_to_non_nullable
as bool,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [JwtUser].
extension JwtUserPatterns on JwtUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JwtUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JwtUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JwtUser value)  $default,){
final _that = this;
switch (_that) {
case _JwtUser():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JwtUser value)?  $default,){
final _that = this;
switch (_that) {
case _JwtUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String fullName,  String country,  List<String> roles,  bool mfaEnabled,  int userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JwtUser() when $default != null:
return $default(_that.email,_that.fullName,_that.country,_that.roles,_that.mfaEnabled,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String fullName,  String country,  List<String> roles,  bool mfaEnabled,  int userId)  $default,) {final _that = this;
switch (_that) {
case _JwtUser():
return $default(_that.email,_that.fullName,_that.country,_that.roles,_that.mfaEnabled,_that.userId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String fullName,  String country,  List<String> roles,  bool mfaEnabled,  int userId)?  $default,) {final _that = this;
switch (_that) {
case _JwtUser() when $default != null:
return $default(_that.email,_that.fullName,_that.country,_that.roles,_that.mfaEnabled,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JwtUser implements JwtUser {
  const _JwtUser({required this.email, required this.fullName, required this.country, required final  List<String> roles, required this.mfaEnabled, required this.userId}): _roles = roles;
  factory _JwtUser.fromJson(Map<String, dynamic> json) => _$JwtUserFromJson(json);

@override final  String email;
@override final  String fullName;
@override final  String country;
 final  List<String> _roles;
@override List<String> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

@override final  bool mfaEnabled;
@override final  int userId;

/// Create a copy of JwtUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JwtUserCopyWith<_JwtUser> get copyWith => __$JwtUserCopyWithImpl<_JwtUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JwtUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JwtUser&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other._roles, _roles)&&(identical(other.mfaEnabled, mfaEnabled) || other.mfaEnabled == mfaEnabled)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,fullName,country,const DeepCollectionEquality().hash(_roles),mfaEnabled,userId);

@override
String toString() {
  return 'JwtUser(email: $email, fullName: $fullName, country: $country, roles: $roles, mfaEnabled: $mfaEnabled, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$JwtUserCopyWith<$Res> implements $JwtUserCopyWith<$Res> {
  factory _$JwtUserCopyWith(_JwtUser value, $Res Function(_JwtUser) _then) = __$JwtUserCopyWithImpl;
@override @useResult
$Res call({
 String email, String fullName, String country, List<String> roles, bool mfaEnabled, int userId
});




}
/// @nodoc
class __$JwtUserCopyWithImpl<$Res>
    implements _$JwtUserCopyWith<$Res> {
  __$JwtUserCopyWithImpl(this._self, this._then);

  final _JwtUser _self;
  final $Res Function(_JwtUser) _then;

/// Create a copy of JwtUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? fullName = null,Object? country = null,Object? roles = null,Object? mfaEnabled = null,Object? userId = null,}) {
  return _then(_JwtUser(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,mfaEnabled: null == mfaEnabled ? _self.mfaEnabled : mfaEnabled // ignore: cast_nullable_to_non_nullable
as bool,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
