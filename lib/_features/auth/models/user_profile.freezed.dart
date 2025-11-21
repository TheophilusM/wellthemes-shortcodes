// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

 int get id; String get firstName; String get surname; String get email; String get countryCode; String? get pictureUrl; String get referralCode; List<String> get roles; UserAudit get userAudit;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.email, email) || other.email == email)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.pictureUrl, pictureUrl) || other.pictureUrl == pictureUrl)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&const DeepCollectionEquality().equals(other.roles, roles)&&(identical(other.userAudit, userAudit) || other.userAudit == userAudit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,surname,email,countryCode,pictureUrl,referralCode,const DeepCollectionEquality().hash(roles),userAudit);

@override
String toString() {
  return 'UserProfile(id: $id, firstName: $firstName, surname: $surname, email: $email, countryCode: $countryCode, pictureUrl: $pictureUrl, referralCode: $referralCode, roles: $roles, userAudit: $userAudit)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 int id, String firstName, String surname, String email, String countryCode, String? pictureUrl, String referralCode, List<String> roles, UserAudit userAudit
});


$UserAuditCopyWith<$Res> get userAudit;

}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? surname = null,Object? email = null,Object? countryCode = null,Object? pictureUrl = freezed,Object? referralCode = null,Object? roles = null,Object? userAudit = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,pictureUrl: freezed == pictureUrl ? _self.pictureUrl : pictureUrl // ignore: cast_nullable_to_non_nullable
as String?,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,userAudit: null == userAudit ? _self.userAudit : userAudit // ignore: cast_nullable_to_non_nullable
as UserAudit,
  ));
}
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAuditCopyWith<$Res> get userAudit {
  
  return $UserAuditCopyWith<$Res>(_self.userAudit, (value) {
    return _then(_self.copyWith(userAudit: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String firstName,  String surname,  String email,  String countryCode,  String? pictureUrl,  String referralCode,  List<String> roles,  UserAudit userAudit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.firstName,_that.surname,_that.email,_that.countryCode,_that.pictureUrl,_that.referralCode,_that.roles,_that.userAudit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String firstName,  String surname,  String email,  String countryCode,  String? pictureUrl,  String referralCode,  List<String> roles,  UserAudit userAudit)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.id,_that.firstName,_that.surname,_that.email,_that.countryCode,_that.pictureUrl,_that.referralCode,_that.roles,_that.userAudit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String firstName,  String surname,  String email,  String countryCode,  String? pictureUrl,  String referralCode,  List<String> roles,  UserAudit userAudit)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.firstName,_that.surname,_that.email,_that.countryCode,_that.pictureUrl,_that.referralCode,_that.roles,_that.userAudit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({required this.id, required this.firstName, required this.surname, required this.email, required this.countryCode, this.pictureUrl, required this.referralCode, required final  List<String> roles, required this.userAudit}): _roles = roles;
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  int id;
@override final  String firstName;
@override final  String surname;
@override final  String email;
@override final  String countryCode;
@override final  String? pictureUrl;
@override final  String referralCode;
 final  List<String> _roles;
@override List<String> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

@override final  UserAudit userAudit;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.email, email) || other.email == email)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.pictureUrl, pictureUrl) || other.pictureUrl == pictureUrl)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&const DeepCollectionEquality().equals(other._roles, _roles)&&(identical(other.userAudit, userAudit) || other.userAudit == userAudit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,surname,email,countryCode,pictureUrl,referralCode,const DeepCollectionEquality().hash(_roles),userAudit);

@override
String toString() {
  return 'UserProfile(id: $id, firstName: $firstName, surname: $surname, email: $email, countryCode: $countryCode, pictureUrl: $pictureUrl, referralCode: $referralCode, roles: $roles, userAudit: $userAudit)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 int id, String firstName, String surname, String email, String countryCode, String? pictureUrl, String referralCode, List<String> roles, UserAudit userAudit
});


@override $UserAuditCopyWith<$Res> get userAudit;

}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? surname = null,Object? email = null,Object? countryCode = null,Object? pictureUrl = freezed,Object? referralCode = null,Object? roles = null,Object? userAudit = null,}) {
  return _then(_UserProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,pictureUrl: freezed == pictureUrl ? _self.pictureUrl : pictureUrl // ignore: cast_nullable_to_non_nullable
as String?,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,userAudit: null == userAudit ? _self.userAudit : userAudit // ignore: cast_nullable_to_non_nullable
as UserAudit,
  ));
}

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAuditCopyWith<$Res> get userAudit {
  
  return $UserAuditCopyWith<$Res>(_self.userAudit, (value) {
    return _then(_self.copyWith(userAudit: value));
  });
}
}


/// @nodoc
mixin _$UserAudit {

 bool get emailVerified; bool get phoneNumberVerified; bool get mfaEnabled; bool get onboarded; bool get accountActive; bool get accountLocked; String? get lastLogin;
/// Create a copy of UserAudit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAuditCopyWith<UserAudit> get copyWith => _$UserAuditCopyWithImpl<UserAudit>(this as UserAudit, _$identity);

  /// Serializes this UserAudit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAudit&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.phoneNumberVerified, phoneNumberVerified) || other.phoneNumberVerified == phoneNumberVerified)&&(identical(other.mfaEnabled, mfaEnabled) || other.mfaEnabled == mfaEnabled)&&(identical(other.onboarded, onboarded) || other.onboarded == onboarded)&&(identical(other.accountActive, accountActive) || other.accountActive == accountActive)&&(identical(other.accountLocked, accountLocked) || other.accountLocked == accountLocked)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,emailVerified,phoneNumberVerified,mfaEnabled,onboarded,accountActive,accountLocked,lastLogin);

@override
String toString() {
  return 'UserAudit(emailVerified: $emailVerified, phoneNumberVerified: $phoneNumberVerified, mfaEnabled: $mfaEnabled, onboarded: $onboarded, accountActive: $accountActive, accountLocked: $accountLocked, lastLogin: $lastLogin)';
}


}

/// @nodoc
abstract mixin class $UserAuditCopyWith<$Res>  {
  factory $UserAuditCopyWith(UserAudit value, $Res Function(UserAudit) _then) = _$UserAuditCopyWithImpl;
@useResult
$Res call({
 bool emailVerified, bool phoneNumberVerified, bool mfaEnabled, bool onboarded, bool accountActive, bool accountLocked, String? lastLogin
});




}
/// @nodoc
class _$UserAuditCopyWithImpl<$Res>
    implements $UserAuditCopyWith<$Res> {
  _$UserAuditCopyWithImpl(this._self, this._then);

  final UserAudit _self;
  final $Res Function(UserAudit) _then;

/// Create a copy of UserAudit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? emailVerified = null,Object? phoneNumberVerified = null,Object? mfaEnabled = null,Object? onboarded = null,Object? accountActive = null,Object? accountLocked = null,Object? lastLogin = freezed,}) {
  return _then(_self.copyWith(
emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,phoneNumberVerified: null == phoneNumberVerified ? _self.phoneNumberVerified : phoneNumberVerified // ignore: cast_nullable_to_non_nullable
as bool,mfaEnabled: null == mfaEnabled ? _self.mfaEnabled : mfaEnabled // ignore: cast_nullable_to_non_nullable
as bool,onboarded: null == onboarded ? _self.onboarded : onboarded // ignore: cast_nullable_to_non_nullable
as bool,accountActive: null == accountActive ? _self.accountActive : accountActive // ignore: cast_nullable_to_non_nullable
as bool,accountLocked: null == accountLocked ? _self.accountLocked : accountLocked // ignore: cast_nullable_to_non_nullable
as bool,lastLogin: freezed == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserAudit].
extension UserAuditPatterns on UserAudit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAudit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAudit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAudit value)  $default,){
final _that = this;
switch (_that) {
case _UserAudit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAudit value)?  $default,){
final _that = this;
switch (_that) {
case _UserAudit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool emailVerified,  bool phoneNumberVerified,  bool mfaEnabled,  bool onboarded,  bool accountActive,  bool accountLocked,  String? lastLogin)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAudit() when $default != null:
return $default(_that.emailVerified,_that.phoneNumberVerified,_that.mfaEnabled,_that.onboarded,_that.accountActive,_that.accountLocked,_that.lastLogin);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool emailVerified,  bool phoneNumberVerified,  bool mfaEnabled,  bool onboarded,  bool accountActive,  bool accountLocked,  String? lastLogin)  $default,) {final _that = this;
switch (_that) {
case _UserAudit():
return $default(_that.emailVerified,_that.phoneNumberVerified,_that.mfaEnabled,_that.onboarded,_that.accountActive,_that.accountLocked,_that.lastLogin);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool emailVerified,  bool phoneNumberVerified,  bool mfaEnabled,  bool onboarded,  bool accountActive,  bool accountLocked,  String? lastLogin)?  $default,) {final _that = this;
switch (_that) {
case _UserAudit() when $default != null:
return $default(_that.emailVerified,_that.phoneNumberVerified,_that.mfaEnabled,_that.onboarded,_that.accountActive,_that.accountLocked,_that.lastLogin);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserAudit implements UserAudit {
  const _UserAudit({required this.emailVerified, required this.phoneNumberVerified, required this.mfaEnabled, required this.onboarded, required this.accountActive, required this.accountLocked, this.lastLogin});
  factory _UserAudit.fromJson(Map<String, dynamic> json) => _$UserAuditFromJson(json);

@override final  bool emailVerified;
@override final  bool phoneNumberVerified;
@override final  bool mfaEnabled;
@override final  bool onboarded;
@override final  bool accountActive;
@override final  bool accountLocked;
@override final  String? lastLogin;

/// Create a copy of UserAudit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAuditCopyWith<_UserAudit> get copyWith => __$UserAuditCopyWithImpl<_UserAudit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserAuditToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAudit&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.phoneNumberVerified, phoneNumberVerified) || other.phoneNumberVerified == phoneNumberVerified)&&(identical(other.mfaEnabled, mfaEnabled) || other.mfaEnabled == mfaEnabled)&&(identical(other.onboarded, onboarded) || other.onboarded == onboarded)&&(identical(other.accountActive, accountActive) || other.accountActive == accountActive)&&(identical(other.accountLocked, accountLocked) || other.accountLocked == accountLocked)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,emailVerified,phoneNumberVerified,mfaEnabled,onboarded,accountActive,accountLocked,lastLogin);

@override
String toString() {
  return 'UserAudit(emailVerified: $emailVerified, phoneNumberVerified: $phoneNumberVerified, mfaEnabled: $mfaEnabled, onboarded: $onboarded, accountActive: $accountActive, accountLocked: $accountLocked, lastLogin: $lastLogin)';
}


}

/// @nodoc
abstract mixin class _$UserAuditCopyWith<$Res> implements $UserAuditCopyWith<$Res> {
  factory _$UserAuditCopyWith(_UserAudit value, $Res Function(_UserAudit) _then) = __$UserAuditCopyWithImpl;
@override @useResult
$Res call({
 bool emailVerified, bool phoneNumberVerified, bool mfaEnabled, bool onboarded, bool accountActive, bool accountLocked, String? lastLogin
});




}
/// @nodoc
class __$UserAuditCopyWithImpl<$Res>
    implements _$UserAuditCopyWith<$Res> {
  __$UserAuditCopyWithImpl(this._self, this._then);

  final _UserAudit _self;
  final $Res Function(_UserAudit) _then;

/// Create a copy of UserAudit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailVerified = null,Object? phoneNumberVerified = null,Object? mfaEnabled = null,Object? onboarded = null,Object? accountActive = null,Object? accountLocked = null,Object? lastLogin = freezed,}) {
  return _then(_UserAudit(
emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,phoneNumberVerified: null == phoneNumberVerified ? _self.phoneNumberVerified : phoneNumberVerified // ignore: cast_nullable_to_non_nullable
as bool,mfaEnabled: null == mfaEnabled ? _self.mfaEnabled : mfaEnabled // ignore: cast_nullable_to_non_nullable
as bool,onboarded: null == onboarded ? _self.onboarded : onboarded // ignore: cast_nullable_to_non_nullable
as bool,accountActive: null == accountActive ? _self.accountActive : accountActive // ignore: cast_nullable_to_non_nullable
as bool,accountLocked: null == accountLocked ? _self.accountLocked : accountLocked // ignore: cast_nullable_to_non_nullable
as bool,lastLogin: freezed == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
