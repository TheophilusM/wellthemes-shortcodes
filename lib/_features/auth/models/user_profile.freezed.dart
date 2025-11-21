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

 String? get title; String? get gender; int get id; String? get middleNames; String? get phoneNumber; DateTime? get dateOfBirth; String get email; String get surname; String get firstName; String get countryCode; String get mfaMethod; String get referralCode; bool get isGoogleOrigin;// Nested objects
 UserAudit get audit; NextOfKin? get nextOfKin; ProfileStatus get profileStatus; List<UserAddresses> get addresses; List<UserSession> get sessions;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.title, title) || other.title == title)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.id, id) || other.id == id)&&(identical(other.middleNames, middleNames) || other.middleNames == middleNames)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.email, email) || other.email == email)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.mfaMethod, mfaMethod) || other.mfaMethod == mfaMethod)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&(identical(other.isGoogleOrigin, isGoogleOrigin) || other.isGoogleOrigin == isGoogleOrigin)&&(identical(other.audit, audit) || other.audit == audit)&&(identical(other.nextOfKin, nextOfKin) || other.nextOfKin == nextOfKin)&&(identical(other.profileStatus, profileStatus) || other.profileStatus == profileStatus)&&const DeepCollectionEquality().equals(other.addresses, addresses)&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,gender,id,middleNames,phoneNumber,dateOfBirth,email,surname,firstName,countryCode,mfaMethod,referralCode,isGoogleOrigin,audit,nextOfKin,profileStatus,const DeepCollectionEquality().hash(addresses),const DeepCollectionEquality().hash(sessions));

@override
String toString() {
  return 'UserProfile(title: $title, gender: $gender, id: $id, middleNames: $middleNames, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, email: $email, surname: $surname, firstName: $firstName, countryCode: $countryCode, mfaMethod: $mfaMethod, referralCode: $referralCode, isGoogleOrigin: $isGoogleOrigin, audit: $audit, nextOfKin: $nextOfKin, profileStatus: $profileStatus, addresses: $addresses, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String? title, String? gender, int id, String? middleNames, String? phoneNumber, DateTime? dateOfBirth, String email, String surname, String firstName, String countryCode, String mfaMethod, String referralCode, bool isGoogleOrigin, UserAudit audit, NextOfKin? nextOfKin, ProfileStatus profileStatus, List<UserAddresses> addresses, List<UserSession> sessions
});


$UserAuditCopyWith<$Res> get audit;$NextOfKinCopyWith<$Res>? get nextOfKin;$ProfileStatusCopyWith<$Res> get profileStatus;

}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? gender = freezed,Object? id = null,Object? middleNames = freezed,Object? phoneNumber = freezed,Object? dateOfBirth = freezed,Object? email = null,Object? surname = null,Object? firstName = null,Object? countryCode = null,Object? mfaMethod = null,Object? referralCode = null,Object? isGoogleOrigin = null,Object? audit = null,Object? nextOfKin = freezed,Object? profileStatus = null,Object? addresses = null,Object? sessions = null,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,middleNames: freezed == middleNames ? _self.middleNames : middleNames // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,mfaMethod: null == mfaMethod ? _self.mfaMethod : mfaMethod // ignore: cast_nullable_to_non_nullable
as String,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,isGoogleOrigin: null == isGoogleOrigin ? _self.isGoogleOrigin : isGoogleOrigin // ignore: cast_nullable_to_non_nullable
as bool,audit: null == audit ? _self.audit : audit // ignore: cast_nullable_to_non_nullable
as UserAudit,nextOfKin: freezed == nextOfKin ? _self.nextOfKin : nextOfKin // ignore: cast_nullable_to_non_nullable
as NextOfKin?,profileStatus: null == profileStatus ? _self.profileStatus : profileStatus // ignore: cast_nullable_to_non_nullable
as ProfileStatus,addresses: null == addresses ? _self.addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<UserAddresses>,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<UserSession>,
  ));
}
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAuditCopyWith<$Res> get audit {
  
  return $UserAuditCopyWith<$Res>(_self.audit, (value) {
    return _then(_self.copyWith(audit: value));
  });
}/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NextOfKinCopyWith<$Res>? get nextOfKin {
    if (_self.nextOfKin == null) {
    return null;
  }

  return $NextOfKinCopyWith<$Res>(_self.nextOfKin!, (value) {
    return _then(_self.copyWith(nextOfKin: value));
  });
}/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileStatusCopyWith<$Res> get profileStatus {
  
  return $ProfileStatusCopyWith<$Res>(_self.profileStatus, (value) {
    return _then(_self.copyWith(profileStatus: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  String? gender,  int id,  String? middleNames,  String? phoneNumber,  DateTime? dateOfBirth,  String email,  String surname,  String firstName,  String countryCode,  String mfaMethod,  String referralCode,  bool isGoogleOrigin,  UserAudit audit,  NextOfKin? nextOfKin,  ProfileStatus profileStatus,  List<UserAddresses> addresses,  List<UserSession> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.title,_that.gender,_that.id,_that.middleNames,_that.phoneNumber,_that.dateOfBirth,_that.email,_that.surname,_that.firstName,_that.countryCode,_that.mfaMethod,_that.referralCode,_that.isGoogleOrigin,_that.audit,_that.nextOfKin,_that.profileStatus,_that.addresses,_that.sessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  String? gender,  int id,  String? middleNames,  String? phoneNumber,  DateTime? dateOfBirth,  String email,  String surname,  String firstName,  String countryCode,  String mfaMethod,  String referralCode,  bool isGoogleOrigin,  UserAudit audit,  NextOfKin? nextOfKin,  ProfileStatus profileStatus,  List<UserAddresses> addresses,  List<UserSession> sessions)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.title,_that.gender,_that.id,_that.middleNames,_that.phoneNumber,_that.dateOfBirth,_that.email,_that.surname,_that.firstName,_that.countryCode,_that.mfaMethod,_that.referralCode,_that.isGoogleOrigin,_that.audit,_that.nextOfKin,_that.profileStatus,_that.addresses,_that.sessions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  String? gender,  int id,  String? middleNames,  String? phoneNumber,  DateTime? dateOfBirth,  String email,  String surname,  String firstName,  String countryCode,  String mfaMethod,  String referralCode,  bool isGoogleOrigin,  UserAudit audit,  NextOfKin? nextOfKin,  ProfileStatus profileStatus,  List<UserAddresses> addresses,  List<UserSession> sessions)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.title,_that.gender,_that.id,_that.middleNames,_that.phoneNumber,_that.dateOfBirth,_that.email,_that.surname,_that.firstName,_that.countryCode,_that.mfaMethod,_that.referralCode,_that.isGoogleOrigin,_that.audit,_that.nextOfKin,_that.profileStatus,_that.addresses,_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({this.title, this.gender, required this.id, this.middleNames, this.phoneNumber, this.dateOfBirth, required this.email, required this.surname, required this.firstName, required this.countryCode, required this.mfaMethod, required this.referralCode, required this.isGoogleOrigin, required this.audit, required this.nextOfKin, required this.profileStatus, required final  List<UserAddresses> addresses, required final  List<UserSession> sessions}): _addresses = addresses,_sessions = sessions;
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  String? title;
@override final  String? gender;
@override final  int id;
@override final  String? middleNames;
@override final  String? phoneNumber;
@override final  DateTime? dateOfBirth;
@override final  String email;
@override final  String surname;
@override final  String firstName;
@override final  String countryCode;
@override final  String mfaMethod;
@override final  String referralCode;
@override final  bool isGoogleOrigin;
// Nested objects
@override final  UserAudit audit;
@override final  NextOfKin? nextOfKin;
@override final  ProfileStatus profileStatus;
 final  List<UserAddresses> _addresses;
@override List<UserAddresses> get addresses {
  if (_addresses is EqualUnmodifiableListView) return _addresses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_addresses);
}

 final  List<UserSession> _sessions;
@override List<UserSession> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.title, title) || other.title == title)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.id, id) || other.id == id)&&(identical(other.middleNames, middleNames) || other.middleNames == middleNames)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.email, email) || other.email == email)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.mfaMethod, mfaMethod) || other.mfaMethod == mfaMethod)&&(identical(other.referralCode, referralCode) || other.referralCode == referralCode)&&(identical(other.isGoogleOrigin, isGoogleOrigin) || other.isGoogleOrigin == isGoogleOrigin)&&(identical(other.audit, audit) || other.audit == audit)&&(identical(other.nextOfKin, nextOfKin) || other.nextOfKin == nextOfKin)&&(identical(other.profileStatus, profileStatus) || other.profileStatus == profileStatus)&&const DeepCollectionEquality().equals(other._addresses, _addresses)&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,gender,id,middleNames,phoneNumber,dateOfBirth,email,surname,firstName,countryCode,mfaMethod,referralCode,isGoogleOrigin,audit,nextOfKin,profileStatus,const DeepCollectionEquality().hash(_addresses),const DeepCollectionEquality().hash(_sessions));

@override
String toString() {
  return 'UserProfile(title: $title, gender: $gender, id: $id, middleNames: $middleNames, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, email: $email, surname: $surname, firstName: $firstName, countryCode: $countryCode, mfaMethod: $mfaMethod, referralCode: $referralCode, isGoogleOrigin: $isGoogleOrigin, audit: $audit, nextOfKin: $nextOfKin, profileStatus: $profileStatus, addresses: $addresses, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? gender, int id, String? middleNames, String? phoneNumber, DateTime? dateOfBirth, String email, String surname, String firstName, String countryCode, String mfaMethod, String referralCode, bool isGoogleOrigin, UserAudit audit, NextOfKin? nextOfKin, ProfileStatus profileStatus, List<UserAddresses> addresses, List<UserSession> sessions
});


@override $UserAuditCopyWith<$Res> get audit;@override $NextOfKinCopyWith<$Res>? get nextOfKin;@override $ProfileStatusCopyWith<$Res> get profileStatus;

}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? gender = freezed,Object? id = null,Object? middleNames = freezed,Object? phoneNumber = freezed,Object? dateOfBirth = freezed,Object? email = null,Object? surname = null,Object? firstName = null,Object? countryCode = null,Object? mfaMethod = null,Object? referralCode = null,Object? isGoogleOrigin = null,Object? audit = null,Object? nextOfKin = freezed,Object? profileStatus = null,Object? addresses = null,Object? sessions = null,}) {
  return _then(_UserProfile(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,middleNames: freezed == middleNames ? _self.middleNames : middleNames // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,mfaMethod: null == mfaMethod ? _self.mfaMethod : mfaMethod // ignore: cast_nullable_to_non_nullable
as String,referralCode: null == referralCode ? _self.referralCode : referralCode // ignore: cast_nullable_to_non_nullable
as String,isGoogleOrigin: null == isGoogleOrigin ? _self.isGoogleOrigin : isGoogleOrigin // ignore: cast_nullable_to_non_nullable
as bool,audit: null == audit ? _self.audit : audit // ignore: cast_nullable_to_non_nullable
as UserAudit,nextOfKin: freezed == nextOfKin ? _self.nextOfKin : nextOfKin // ignore: cast_nullable_to_non_nullable
as NextOfKin?,profileStatus: null == profileStatus ? _self.profileStatus : profileStatus // ignore: cast_nullable_to_non_nullable
as ProfileStatus,addresses: null == addresses ? _self._addresses : addresses // ignore: cast_nullable_to_non_nullable
as List<UserAddresses>,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<UserSession>,
  ));
}

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAuditCopyWith<$Res> get audit {
  
  return $UserAuditCopyWith<$Res>(_self.audit, (value) {
    return _then(_self.copyWith(audit: value));
  });
}/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NextOfKinCopyWith<$Res>? get nextOfKin {
    if (_self.nextOfKin == null) {
    return null;
  }

  return $NextOfKinCopyWith<$Res>(_self.nextOfKin!, (value) {
    return _then(_self.copyWith(nextOfKin: value));
  });
}/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileStatusCopyWith<$Res> get profileStatus {
  
  return $ProfileStatusCopyWith<$Res>(_self.profileStatus, (value) {
    return _then(_self.copyWith(profileStatus: value));
  });
}
}


/// @nodoc
mixin _$UserAudit {

 int get loginAttempts; DateTime? get lastFailedLogin; bool get isMfaEnabled; bool get isEmailVerified; bool get isPhoneNumberVerified; bool get isAccountLocked; bool get isAccountActive; bool get isOnboarded; DateTime? get lastLogin; bool get isNewsLetterActive;
/// Create a copy of UserAudit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAuditCopyWith<UserAudit> get copyWith => _$UserAuditCopyWithImpl<UserAudit>(this as UserAudit, _$identity);

  /// Serializes this UserAudit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAudit&&(identical(other.loginAttempts, loginAttempts) || other.loginAttempts == loginAttempts)&&(identical(other.lastFailedLogin, lastFailedLogin) || other.lastFailedLogin == lastFailedLogin)&&(identical(other.isMfaEnabled, isMfaEnabled) || other.isMfaEnabled == isMfaEnabled)&&(identical(other.isEmailVerified, isEmailVerified) || other.isEmailVerified == isEmailVerified)&&(identical(other.isPhoneNumberVerified, isPhoneNumberVerified) || other.isPhoneNumberVerified == isPhoneNumberVerified)&&(identical(other.isAccountLocked, isAccountLocked) || other.isAccountLocked == isAccountLocked)&&(identical(other.isAccountActive, isAccountActive) || other.isAccountActive == isAccountActive)&&(identical(other.isOnboarded, isOnboarded) || other.isOnboarded == isOnboarded)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.isNewsLetterActive, isNewsLetterActive) || other.isNewsLetterActive == isNewsLetterActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,loginAttempts,lastFailedLogin,isMfaEnabled,isEmailVerified,isPhoneNumberVerified,isAccountLocked,isAccountActive,isOnboarded,lastLogin,isNewsLetterActive);

@override
String toString() {
  return 'UserAudit(loginAttempts: $loginAttempts, lastFailedLogin: $lastFailedLogin, isMfaEnabled: $isMfaEnabled, isEmailVerified: $isEmailVerified, isPhoneNumberVerified: $isPhoneNumberVerified, isAccountLocked: $isAccountLocked, isAccountActive: $isAccountActive, isOnboarded: $isOnboarded, lastLogin: $lastLogin, isNewsLetterActive: $isNewsLetterActive)';
}


}

/// @nodoc
abstract mixin class $UserAuditCopyWith<$Res>  {
  factory $UserAuditCopyWith(UserAudit value, $Res Function(UserAudit) _then) = _$UserAuditCopyWithImpl;
@useResult
$Res call({
 int loginAttempts, DateTime? lastFailedLogin, bool isMfaEnabled, bool isEmailVerified, bool isPhoneNumberVerified, bool isAccountLocked, bool isAccountActive, bool isOnboarded, DateTime? lastLogin, bool isNewsLetterActive
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
@pragma('vm:prefer-inline') @override $Res call({Object? loginAttempts = null,Object? lastFailedLogin = freezed,Object? isMfaEnabled = null,Object? isEmailVerified = null,Object? isPhoneNumberVerified = null,Object? isAccountLocked = null,Object? isAccountActive = null,Object? isOnboarded = null,Object? lastLogin = freezed,Object? isNewsLetterActive = null,}) {
  return _then(_self.copyWith(
loginAttempts: null == loginAttempts ? _self.loginAttempts : loginAttempts // ignore: cast_nullable_to_non_nullable
as int,lastFailedLogin: freezed == lastFailedLogin ? _self.lastFailedLogin : lastFailedLogin // ignore: cast_nullable_to_non_nullable
as DateTime?,isMfaEnabled: null == isMfaEnabled ? _self.isMfaEnabled : isMfaEnabled // ignore: cast_nullable_to_non_nullable
as bool,isEmailVerified: null == isEmailVerified ? _self.isEmailVerified : isEmailVerified // ignore: cast_nullable_to_non_nullable
as bool,isPhoneNumberVerified: null == isPhoneNumberVerified ? _self.isPhoneNumberVerified : isPhoneNumberVerified // ignore: cast_nullable_to_non_nullable
as bool,isAccountLocked: null == isAccountLocked ? _self.isAccountLocked : isAccountLocked // ignore: cast_nullable_to_non_nullable
as bool,isAccountActive: null == isAccountActive ? _self.isAccountActive : isAccountActive // ignore: cast_nullable_to_non_nullable
as bool,isOnboarded: null == isOnboarded ? _self.isOnboarded : isOnboarded // ignore: cast_nullable_to_non_nullable
as bool,lastLogin: freezed == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as DateTime?,isNewsLetterActive: null == isNewsLetterActive ? _self.isNewsLetterActive : isNewsLetterActive // ignore: cast_nullable_to_non_nullable
as bool,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int loginAttempts,  DateTime? lastFailedLogin,  bool isMfaEnabled,  bool isEmailVerified,  bool isPhoneNumberVerified,  bool isAccountLocked,  bool isAccountActive,  bool isOnboarded,  DateTime? lastLogin,  bool isNewsLetterActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAudit() when $default != null:
return $default(_that.loginAttempts,_that.lastFailedLogin,_that.isMfaEnabled,_that.isEmailVerified,_that.isPhoneNumberVerified,_that.isAccountLocked,_that.isAccountActive,_that.isOnboarded,_that.lastLogin,_that.isNewsLetterActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int loginAttempts,  DateTime? lastFailedLogin,  bool isMfaEnabled,  bool isEmailVerified,  bool isPhoneNumberVerified,  bool isAccountLocked,  bool isAccountActive,  bool isOnboarded,  DateTime? lastLogin,  bool isNewsLetterActive)  $default,) {final _that = this;
switch (_that) {
case _UserAudit():
return $default(_that.loginAttempts,_that.lastFailedLogin,_that.isMfaEnabled,_that.isEmailVerified,_that.isPhoneNumberVerified,_that.isAccountLocked,_that.isAccountActive,_that.isOnboarded,_that.lastLogin,_that.isNewsLetterActive);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int loginAttempts,  DateTime? lastFailedLogin,  bool isMfaEnabled,  bool isEmailVerified,  bool isPhoneNumberVerified,  bool isAccountLocked,  bool isAccountActive,  bool isOnboarded,  DateTime? lastLogin,  bool isNewsLetterActive)?  $default,) {final _that = this;
switch (_that) {
case _UserAudit() when $default != null:
return $default(_that.loginAttempts,_that.lastFailedLogin,_that.isMfaEnabled,_that.isEmailVerified,_that.isPhoneNumberVerified,_that.isAccountLocked,_that.isAccountActive,_that.isOnboarded,_that.lastLogin,_that.isNewsLetterActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserAudit implements UserAudit {
  const _UserAudit({required this.loginAttempts, this.lastFailedLogin, required this.isMfaEnabled, required this.isEmailVerified, required this.isPhoneNumberVerified, required this.isAccountLocked, required this.isAccountActive, required this.isOnboarded, this.lastLogin, required this.isNewsLetterActive});
  factory _UserAudit.fromJson(Map<String, dynamic> json) => _$UserAuditFromJson(json);

@override final  int loginAttempts;
@override final  DateTime? lastFailedLogin;
@override final  bool isMfaEnabled;
@override final  bool isEmailVerified;
@override final  bool isPhoneNumberVerified;
@override final  bool isAccountLocked;
@override final  bool isAccountActive;
@override final  bool isOnboarded;
@override final  DateTime? lastLogin;
@override final  bool isNewsLetterActive;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAudit&&(identical(other.loginAttempts, loginAttempts) || other.loginAttempts == loginAttempts)&&(identical(other.lastFailedLogin, lastFailedLogin) || other.lastFailedLogin == lastFailedLogin)&&(identical(other.isMfaEnabled, isMfaEnabled) || other.isMfaEnabled == isMfaEnabled)&&(identical(other.isEmailVerified, isEmailVerified) || other.isEmailVerified == isEmailVerified)&&(identical(other.isPhoneNumberVerified, isPhoneNumberVerified) || other.isPhoneNumberVerified == isPhoneNumberVerified)&&(identical(other.isAccountLocked, isAccountLocked) || other.isAccountLocked == isAccountLocked)&&(identical(other.isAccountActive, isAccountActive) || other.isAccountActive == isAccountActive)&&(identical(other.isOnboarded, isOnboarded) || other.isOnboarded == isOnboarded)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.isNewsLetterActive, isNewsLetterActive) || other.isNewsLetterActive == isNewsLetterActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,loginAttempts,lastFailedLogin,isMfaEnabled,isEmailVerified,isPhoneNumberVerified,isAccountLocked,isAccountActive,isOnboarded,lastLogin,isNewsLetterActive);

@override
String toString() {
  return 'UserAudit(loginAttempts: $loginAttempts, lastFailedLogin: $lastFailedLogin, isMfaEnabled: $isMfaEnabled, isEmailVerified: $isEmailVerified, isPhoneNumberVerified: $isPhoneNumberVerified, isAccountLocked: $isAccountLocked, isAccountActive: $isAccountActive, isOnboarded: $isOnboarded, lastLogin: $lastLogin, isNewsLetterActive: $isNewsLetterActive)';
}


}

/// @nodoc
abstract mixin class _$UserAuditCopyWith<$Res> implements $UserAuditCopyWith<$Res> {
  factory _$UserAuditCopyWith(_UserAudit value, $Res Function(_UserAudit) _then) = __$UserAuditCopyWithImpl;
@override @useResult
$Res call({
 int loginAttempts, DateTime? lastFailedLogin, bool isMfaEnabled, bool isEmailVerified, bool isPhoneNumberVerified, bool isAccountLocked, bool isAccountActive, bool isOnboarded, DateTime? lastLogin, bool isNewsLetterActive
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
@override @pragma('vm:prefer-inline') $Res call({Object? loginAttempts = null,Object? lastFailedLogin = freezed,Object? isMfaEnabled = null,Object? isEmailVerified = null,Object? isPhoneNumberVerified = null,Object? isAccountLocked = null,Object? isAccountActive = null,Object? isOnboarded = null,Object? lastLogin = freezed,Object? isNewsLetterActive = null,}) {
  return _then(_UserAudit(
loginAttempts: null == loginAttempts ? _self.loginAttempts : loginAttempts // ignore: cast_nullable_to_non_nullable
as int,lastFailedLogin: freezed == lastFailedLogin ? _self.lastFailedLogin : lastFailedLogin // ignore: cast_nullable_to_non_nullable
as DateTime?,isMfaEnabled: null == isMfaEnabled ? _self.isMfaEnabled : isMfaEnabled // ignore: cast_nullable_to_non_nullable
as bool,isEmailVerified: null == isEmailVerified ? _self.isEmailVerified : isEmailVerified // ignore: cast_nullable_to_non_nullable
as bool,isPhoneNumberVerified: null == isPhoneNumberVerified ? _self.isPhoneNumberVerified : isPhoneNumberVerified // ignore: cast_nullable_to_non_nullable
as bool,isAccountLocked: null == isAccountLocked ? _self.isAccountLocked : isAccountLocked // ignore: cast_nullable_to_non_nullable
as bool,isAccountActive: null == isAccountActive ? _self.isAccountActive : isAccountActive // ignore: cast_nullable_to_non_nullable
as bool,isOnboarded: null == isOnboarded ? _self.isOnboarded : isOnboarded // ignore: cast_nullable_to_non_nullable
as bool,lastLogin: freezed == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as DateTime?,isNewsLetterActive: null == isNewsLetterActive ? _self.isNewsLetterActive : isNewsLetterActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ProfileStatus {

 bool get isOnboarded; bool get hasAddress; bool get hasNextOfKin; int get profileCompletionPercentage; DateTime get dateLastModified;
/// Create a copy of ProfileStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStatusCopyWith<ProfileStatus> get copyWith => _$ProfileStatusCopyWithImpl<ProfileStatus>(this as ProfileStatus, _$identity);

  /// Serializes this ProfileStatus to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileStatus&&(identical(other.isOnboarded, isOnboarded) || other.isOnboarded == isOnboarded)&&(identical(other.hasAddress, hasAddress) || other.hasAddress == hasAddress)&&(identical(other.hasNextOfKin, hasNextOfKin) || other.hasNextOfKin == hasNextOfKin)&&(identical(other.profileCompletionPercentage, profileCompletionPercentage) || other.profileCompletionPercentage == profileCompletionPercentage)&&(identical(other.dateLastModified, dateLastModified) || other.dateLastModified == dateLastModified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isOnboarded,hasAddress,hasNextOfKin,profileCompletionPercentage,dateLastModified);

@override
String toString() {
  return 'ProfileStatus(isOnboarded: $isOnboarded, hasAddress: $hasAddress, hasNextOfKin: $hasNextOfKin, profileCompletionPercentage: $profileCompletionPercentage, dateLastModified: $dateLastModified)';
}


}

/// @nodoc
abstract mixin class $ProfileStatusCopyWith<$Res>  {
  factory $ProfileStatusCopyWith(ProfileStatus value, $Res Function(ProfileStatus) _then) = _$ProfileStatusCopyWithImpl;
@useResult
$Res call({
 bool isOnboarded, bool hasAddress, bool hasNextOfKin, int profileCompletionPercentage, DateTime dateLastModified
});




}
/// @nodoc
class _$ProfileStatusCopyWithImpl<$Res>
    implements $ProfileStatusCopyWith<$Res> {
  _$ProfileStatusCopyWithImpl(this._self, this._then);

  final ProfileStatus _self;
  final $Res Function(ProfileStatus) _then;

/// Create a copy of ProfileStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isOnboarded = null,Object? hasAddress = null,Object? hasNextOfKin = null,Object? profileCompletionPercentage = null,Object? dateLastModified = null,}) {
  return _then(_self.copyWith(
isOnboarded: null == isOnboarded ? _self.isOnboarded : isOnboarded // ignore: cast_nullable_to_non_nullable
as bool,hasAddress: null == hasAddress ? _self.hasAddress : hasAddress // ignore: cast_nullable_to_non_nullable
as bool,hasNextOfKin: null == hasNextOfKin ? _self.hasNextOfKin : hasNextOfKin // ignore: cast_nullable_to_non_nullable
as bool,profileCompletionPercentage: null == profileCompletionPercentage ? _self.profileCompletionPercentage : profileCompletionPercentage // ignore: cast_nullable_to_non_nullable
as int,dateLastModified: null == dateLastModified ? _self.dateLastModified : dateLastModified // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileStatus].
extension ProfileStatusPatterns on ProfileStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileStatus value)  $default,){
final _that = this;
switch (_that) {
case _ProfileStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileStatus value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isOnboarded,  bool hasAddress,  bool hasNextOfKin,  int profileCompletionPercentage,  DateTime dateLastModified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileStatus() when $default != null:
return $default(_that.isOnboarded,_that.hasAddress,_that.hasNextOfKin,_that.profileCompletionPercentage,_that.dateLastModified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isOnboarded,  bool hasAddress,  bool hasNextOfKin,  int profileCompletionPercentage,  DateTime dateLastModified)  $default,) {final _that = this;
switch (_that) {
case _ProfileStatus():
return $default(_that.isOnboarded,_that.hasAddress,_that.hasNextOfKin,_that.profileCompletionPercentage,_that.dateLastModified);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isOnboarded,  bool hasAddress,  bool hasNextOfKin,  int profileCompletionPercentage,  DateTime dateLastModified)?  $default,) {final _that = this;
switch (_that) {
case _ProfileStatus() when $default != null:
return $default(_that.isOnboarded,_that.hasAddress,_that.hasNextOfKin,_that.profileCompletionPercentage,_that.dateLastModified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileStatus implements ProfileStatus {
  const _ProfileStatus({required this.isOnboarded, required this.hasAddress, required this.hasNextOfKin, required this.profileCompletionPercentage, required this.dateLastModified});
  factory _ProfileStatus.fromJson(Map<String, dynamic> json) => _$ProfileStatusFromJson(json);

@override final  bool isOnboarded;
@override final  bool hasAddress;
@override final  bool hasNextOfKin;
@override final  int profileCompletionPercentage;
@override final  DateTime dateLastModified;

/// Create a copy of ProfileStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStatusCopyWith<_ProfileStatus> get copyWith => __$ProfileStatusCopyWithImpl<_ProfileStatus>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileStatusToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileStatus&&(identical(other.isOnboarded, isOnboarded) || other.isOnboarded == isOnboarded)&&(identical(other.hasAddress, hasAddress) || other.hasAddress == hasAddress)&&(identical(other.hasNextOfKin, hasNextOfKin) || other.hasNextOfKin == hasNextOfKin)&&(identical(other.profileCompletionPercentage, profileCompletionPercentage) || other.profileCompletionPercentage == profileCompletionPercentage)&&(identical(other.dateLastModified, dateLastModified) || other.dateLastModified == dateLastModified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isOnboarded,hasAddress,hasNextOfKin,profileCompletionPercentage,dateLastModified);

@override
String toString() {
  return 'ProfileStatus(isOnboarded: $isOnboarded, hasAddress: $hasAddress, hasNextOfKin: $hasNextOfKin, profileCompletionPercentage: $profileCompletionPercentage, dateLastModified: $dateLastModified)';
}


}

/// @nodoc
abstract mixin class _$ProfileStatusCopyWith<$Res> implements $ProfileStatusCopyWith<$Res> {
  factory _$ProfileStatusCopyWith(_ProfileStatus value, $Res Function(_ProfileStatus) _then) = __$ProfileStatusCopyWithImpl;
@override @useResult
$Res call({
 bool isOnboarded, bool hasAddress, bool hasNextOfKin, int profileCompletionPercentage, DateTime dateLastModified
});




}
/// @nodoc
class __$ProfileStatusCopyWithImpl<$Res>
    implements _$ProfileStatusCopyWith<$Res> {
  __$ProfileStatusCopyWithImpl(this._self, this._then);

  final _ProfileStatus _self;
  final $Res Function(_ProfileStatus) _then;

/// Create a copy of ProfileStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isOnboarded = null,Object? hasAddress = null,Object? hasNextOfKin = null,Object? profileCompletionPercentage = null,Object? dateLastModified = null,}) {
  return _then(_ProfileStatus(
isOnboarded: null == isOnboarded ? _self.isOnboarded : isOnboarded // ignore: cast_nullable_to_non_nullable
as bool,hasAddress: null == hasAddress ? _self.hasAddress : hasAddress // ignore: cast_nullable_to_non_nullable
as bool,hasNextOfKin: null == hasNextOfKin ? _self.hasNextOfKin : hasNextOfKin // ignore: cast_nullable_to_non_nullable
as bool,profileCompletionPercentage: null == profileCompletionPercentage ? _self.profileCompletionPercentage : profileCompletionPercentage // ignore: cast_nullable_to_non_nullable
as int,dateLastModified: null == dateLastModified ? _self.dateLastModified : dateLastModified // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$NextOfKin {

 int get id; String get firstName; String? get middleNames; String get surname; String? get gender; String get relationship; String get email; String? get phoneNumber; DateTime? get dateOfBirth; String? get notes; DateTime get dateCreated; DateTime get dateLastModified;
/// Create a copy of NextOfKin
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NextOfKinCopyWith<NextOfKin> get copyWith => _$NextOfKinCopyWithImpl<NextOfKin>(this as NextOfKin, _$identity);

  /// Serializes this NextOfKin to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NextOfKin&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.middleNames, middleNames) || other.middleNames == middleNames)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.relationship, relationship) || other.relationship == relationship)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.dateLastModified, dateLastModified) || other.dateLastModified == dateLastModified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,middleNames,surname,gender,relationship,email,phoneNumber,dateOfBirth,notes,dateCreated,dateLastModified);

@override
String toString() {
  return 'NextOfKin(id: $id, firstName: $firstName, middleNames: $middleNames, surname: $surname, gender: $gender, relationship: $relationship, email: $email, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, notes: $notes, dateCreated: $dateCreated, dateLastModified: $dateLastModified)';
}


}

/// @nodoc
abstract mixin class $NextOfKinCopyWith<$Res>  {
  factory $NextOfKinCopyWith(NextOfKin value, $Res Function(NextOfKin) _then) = _$NextOfKinCopyWithImpl;
@useResult
$Res call({
 int id, String firstName, String? middleNames, String surname, String? gender, String relationship, String email, String? phoneNumber, DateTime? dateOfBirth, String? notes, DateTime dateCreated, DateTime dateLastModified
});




}
/// @nodoc
class _$NextOfKinCopyWithImpl<$Res>
    implements $NextOfKinCopyWith<$Res> {
  _$NextOfKinCopyWithImpl(this._self, this._then);

  final NextOfKin _self;
  final $Res Function(NextOfKin) _then;

/// Create a copy of NextOfKin
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? middleNames = freezed,Object? surname = null,Object? gender = freezed,Object? relationship = null,Object? email = null,Object? phoneNumber = freezed,Object? dateOfBirth = freezed,Object? notes = freezed,Object? dateCreated = null,Object? dateLastModified = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,middleNames: freezed == middleNames ? _self.middleNames : middleNames // ignore: cast_nullable_to_non_nullable
as String?,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,relationship: null == relationship ? _self.relationship : relationship // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as DateTime,dateLastModified: null == dateLastModified ? _self.dateLastModified : dateLastModified // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [NextOfKin].
extension NextOfKinPatterns on NextOfKin {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NextOfKin value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NextOfKin() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NextOfKin value)  $default,){
final _that = this;
switch (_that) {
case _NextOfKin():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NextOfKin value)?  $default,){
final _that = this;
switch (_that) {
case _NextOfKin() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String firstName,  String? middleNames,  String surname,  String? gender,  String relationship,  String email,  String? phoneNumber,  DateTime? dateOfBirth,  String? notes,  DateTime dateCreated,  DateTime dateLastModified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NextOfKin() when $default != null:
return $default(_that.id,_that.firstName,_that.middleNames,_that.surname,_that.gender,_that.relationship,_that.email,_that.phoneNumber,_that.dateOfBirth,_that.notes,_that.dateCreated,_that.dateLastModified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String firstName,  String? middleNames,  String surname,  String? gender,  String relationship,  String email,  String? phoneNumber,  DateTime? dateOfBirth,  String? notes,  DateTime dateCreated,  DateTime dateLastModified)  $default,) {final _that = this;
switch (_that) {
case _NextOfKin():
return $default(_that.id,_that.firstName,_that.middleNames,_that.surname,_that.gender,_that.relationship,_that.email,_that.phoneNumber,_that.dateOfBirth,_that.notes,_that.dateCreated,_that.dateLastModified);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String firstName,  String? middleNames,  String surname,  String? gender,  String relationship,  String email,  String? phoneNumber,  DateTime? dateOfBirth,  String? notes,  DateTime dateCreated,  DateTime dateLastModified)?  $default,) {final _that = this;
switch (_that) {
case _NextOfKin() when $default != null:
return $default(_that.id,_that.firstName,_that.middleNames,_that.surname,_that.gender,_that.relationship,_that.email,_that.phoneNumber,_that.dateOfBirth,_that.notes,_that.dateCreated,_that.dateLastModified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NextOfKin implements NextOfKin {
  const _NextOfKin({required this.id, required this.firstName, this.middleNames, required this.surname, this.gender, required this.relationship, required this.email, this.phoneNumber, this.dateOfBirth, this.notes, required this.dateCreated, required this.dateLastModified});
  factory _NextOfKin.fromJson(Map<String, dynamic> json) => _$NextOfKinFromJson(json);

@override final  int id;
@override final  String firstName;
@override final  String? middleNames;
@override final  String surname;
@override final  String? gender;
@override final  String relationship;
@override final  String email;
@override final  String? phoneNumber;
@override final  DateTime? dateOfBirth;
@override final  String? notes;
@override final  DateTime dateCreated;
@override final  DateTime dateLastModified;

/// Create a copy of NextOfKin
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NextOfKinCopyWith<_NextOfKin> get copyWith => __$NextOfKinCopyWithImpl<_NextOfKin>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NextOfKinToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NextOfKin&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.middleNames, middleNames) || other.middleNames == middleNames)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.relationship, relationship) || other.relationship == relationship)&&(identical(other.email, email) || other.email == email)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.dateLastModified, dateLastModified) || other.dateLastModified == dateLastModified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,middleNames,surname,gender,relationship,email,phoneNumber,dateOfBirth,notes,dateCreated,dateLastModified);

@override
String toString() {
  return 'NextOfKin(id: $id, firstName: $firstName, middleNames: $middleNames, surname: $surname, gender: $gender, relationship: $relationship, email: $email, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, notes: $notes, dateCreated: $dateCreated, dateLastModified: $dateLastModified)';
}


}

/// @nodoc
abstract mixin class _$NextOfKinCopyWith<$Res> implements $NextOfKinCopyWith<$Res> {
  factory _$NextOfKinCopyWith(_NextOfKin value, $Res Function(_NextOfKin) _then) = __$NextOfKinCopyWithImpl;
@override @useResult
$Res call({
 int id, String firstName, String? middleNames, String surname, String? gender, String relationship, String email, String? phoneNumber, DateTime? dateOfBirth, String? notes, DateTime dateCreated, DateTime dateLastModified
});




}
/// @nodoc
class __$NextOfKinCopyWithImpl<$Res>
    implements _$NextOfKinCopyWith<$Res> {
  __$NextOfKinCopyWithImpl(this._self, this._then);

  final _NextOfKin _self;
  final $Res Function(_NextOfKin) _then;

/// Create a copy of NextOfKin
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? middleNames = freezed,Object? surname = null,Object? gender = freezed,Object? relationship = null,Object? email = null,Object? phoneNumber = freezed,Object? dateOfBirth = freezed,Object? notes = freezed,Object? dateCreated = null,Object? dateLastModified = null,}) {
  return _then(_NextOfKin(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,middleNames: freezed == middleNames ? _self.middleNames : middleNames // ignore: cast_nullable_to_non_nullable
as String?,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,relationship: null == relationship ? _self.relationship : relationship // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as DateTime,dateLastModified: null == dateLastModified ? _self.dateLastModified : dateLastModified // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$UserAddresses {

 int get id; String get addressLine1; String? get addressLine2; String get city; String? get state; String? get zipCode; String get country; String get countryCode; String get addressType; bool get isDefault; bool get isActive; double get latitude; double get longitude; DateTime get dateCreated; DateTime get dateLastModified;
/// Create a copy of UserAddresses
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAddressesCopyWith<UserAddresses> get copyWith => _$UserAddressesCopyWithImpl<UserAddresses>(this as UserAddresses, _$identity);

  /// Serializes this UserAddresses to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserAddresses&&(identical(other.id, id) || other.id == id)&&(identical(other.addressLine1, addressLine1) || other.addressLine1 == addressLine1)&&(identical(other.addressLine2, addressLine2) || other.addressLine2 == addressLine2)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.country, country) || other.country == country)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.addressType, addressType) || other.addressType == addressType)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.dateLastModified, dateLastModified) || other.dateLastModified == dateLastModified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,addressLine1,addressLine2,city,state,zipCode,country,countryCode,addressType,isDefault,isActive,latitude,longitude,dateCreated,dateLastModified);

@override
String toString() {
  return 'UserAddresses(id: $id, addressLine1: $addressLine1, addressLine2: $addressLine2, city: $city, state: $state, zipCode: $zipCode, country: $country, countryCode: $countryCode, addressType: $addressType, isDefault: $isDefault, isActive: $isActive, latitude: $latitude, longitude: $longitude, dateCreated: $dateCreated, dateLastModified: $dateLastModified)';
}


}

/// @nodoc
abstract mixin class $UserAddressesCopyWith<$Res>  {
  factory $UserAddressesCopyWith(UserAddresses value, $Res Function(UserAddresses) _then) = _$UserAddressesCopyWithImpl;
@useResult
$Res call({
 int id, String addressLine1, String? addressLine2, String city, String? state, String? zipCode, String country, String countryCode, String addressType, bool isDefault, bool isActive, double latitude, double longitude, DateTime dateCreated, DateTime dateLastModified
});




}
/// @nodoc
class _$UserAddressesCopyWithImpl<$Res>
    implements $UserAddressesCopyWith<$Res> {
  _$UserAddressesCopyWithImpl(this._self, this._then);

  final UserAddresses _self;
  final $Res Function(UserAddresses) _then;

/// Create a copy of UserAddresses
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? addressLine1 = null,Object? addressLine2 = freezed,Object? city = null,Object? state = freezed,Object? zipCode = freezed,Object? country = null,Object? countryCode = null,Object? addressType = null,Object? isDefault = null,Object? isActive = null,Object? latitude = null,Object? longitude = null,Object? dateCreated = null,Object? dateLastModified = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,addressLine1: null == addressLine1 ? _self.addressLine1 : addressLine1 // ignore: cast_nullable_to_non_nullable
as String,addressLine2: freezed == addressLine2 ? _self.addressLine2 : addressLine2 // ignore: cast_nullable_to_non_nullable
as String?,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,zipCode: freezed == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String?,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,addressType: null == addressType ? _self.addressType : addressType // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as DateTime,dateLastModified: null == dateLastModified ? _self.dateLastModified : dateLastModified // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserAddresses].
extension UserAddressesPatterns on UserAddresses {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAddresses value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAddresses() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAddresses value)  $default,){
final _that = this;
switch (_that) {
case _UserAddresses():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAddresses value)?  $default,){
final _that = this;
switch (_that) {
case _UserAddresses() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String addressLine1,  String? addressLine2,  String city,  String? state,  String? zipCode,  String country,  String countryCode,  String addressType,  bool isDefault,  bool isActive,  double latitude,  double longitude,  DateTime dateCreated,  DateTime dateLastModified)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAddresses() when $default != null:
return $default(_that.id,_that.addressLine1,_that.addressLine2,_that.city,_that.state,_that.zipCode,_that.country,_that.countryCode,_that.addressType,_that.isDefault,_that.isActive,_that.latitude,_that.longitude,_that.dateCreated,_that.dateLastModified);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String addressLine1,  String? addressLine2,  String city,  String? state,  String? zipCode,  String country,  String countryCode,  String addressType,  bool isDefault,  bool isActive,  double latitude,  double longitude,  DateTime dateCreated,  DateTime dateLastModified)  $default,) {final _that = this;
switch (_that) {
case _UserAddresses():
return $default(_that.id,_that.addressLine1,_that.addressLine2,_that.city,_that.state,_that.zipCode,_that.country,_that.countryCode,_that.addressType,_that.isDefault,_that.isActive,_that.latitude,_that.longitude,_that.dateCreated,_that.dateLastModified);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String addressLine1,  String? addressLine2,  String city,  String? state,  String? zipCode,  String country,  String countryCode,  String addressType,  bool isDefault,  bool isActive,  double latitude,  double longitude,  DateTime dateCreated,  DateTime dateLastModified)?  $default,) {final _that = this;
switch (_that) {
case _UserAddresses() when $default != null:
return $default(_that.id,_that.addressLine1,_that.addressLine2,_that.city,_that.state,_that.zipCode,_that.country,_that.countryCode,_that.addressType,_that.isDefault,_that.isActive,_that.latitude,_that.longitude,_that.dateCreated,_that.dateLastModified);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserAddresses implements UserAddresses {
  const _UserAddresses({required this.id, required this.addressLine1, this.addressLine2, required this.city, this.state, this.zipCode, required this.country, required this.countryCode, required this.addressType, required this.isDefault, required this.isActive, required this.latitude, required this.longitude, required this.dateCreated, required this.dateLastModified});
  factory _UserAddresses.fromJson(Map<String, dynamic> json) => _$UserAddressesFromJson(json);

@override final  int id;
@override final  String addressLine1;
@override final  String? addressLine2;
@override final  String city;
@override final  String? state;
@override final  String? zipCode;
@override final  String country;
@override final  String countryCode;
@override final  String addressType;
@override final  bool isDefault;
@override final  bool isActive;
@override final  double latitude;
@override final  double longitude;
@override final  DateTime dateCreated;
@override final  DateTime dateLastModified;

/// Create a copy of UserAddresses
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAddressesCopyWith<_UserAddresses> get copyWith => __$UserAddressesCopyWithImpl<_UserAddresses>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserAddressesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserAddresses&&(identical(other.id, id) || other.id == id)&&(identical(other.addressLine1, addressLine1) || other.addressLine1 == addressLine1)&&(identical(other.addressLine2, addressLine2) || other.addressLine2 == addressLine2)&&(identical(other.city, city) || other.city == city)&&(identical(other.state, state) || other.state == state)&&(identical(other.zipCode, zipCode) || other.zipCode == zipCode)&&(identical(other.country, country) || other.country == country)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.addressType, addressType) || other.addressType == addressType)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.dateLastModified, dateLastModified) || other.dateLastModified == dateLastModified));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,addressLine1,addressLine2,city,state,zipCode,country,countryCode,addressType,isDefault,isActive,latitude,longitude,dateCreated,dateLastModified);

@override
String toString() {
  return 'UserAddresses(id: $id, addressLine1: $addressLine1, addressLine2: $addressLine2, city: $city, state: $state, zipCode: $zipCode, country: $country, countryCode: $countryCode, addressType: $addressType, isDefault: $isDefault, isActive: $isActive, latitude: $latitude, longitude: $longitude, dateCreated: $dateCreated, dateLastModified: $dateLastModified)';
}


}

/// @nodoc
abstract mixin class _$UserAddressesCopyWith<$Res> implements $UserAddressesCopyWith<$Res> {
  factory _$UserAddressesCopyWith(_UserAddresses value, $Res Function(_UserAddresses) _then) = __$UserAddressesCopyWithImpl;
@override @useResult
$Res call({
 int id, String addressLine1, String? addressLine2, String city, String? state, String? zipCode, String country, String countryCode, String addressType, bool isDefault, bool isActive, double latitude, double longitude, DateTime dateCreated, DateTime dateLastModified
});




}
/// @nodoc
class __$UserAddressesCopyWithImpl<$Res>
    implements _$UserAddressesCopyWith<$Res> {
  __$UserAddressesCopyWithImpl(this._self, this._then);

  final _UserAddresses _self;
  final $Res Function(_UserAddresses) _then;

/// Create a copy of UserAddresses
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? addressLine1 = null,Object? addressLine2 = freezed,Object? city = null,Object? state = freezed,Object? zipCode = freezed,Object? country = null,Object? countryCode = null,Object? addressType = null,Object? isDefault = null,Object? isActive = null,Object? latitude = null,Object? longitude = null,Object? dateCreated = null,Object? dateLastModified = null,}) {
  return _then(_UserAddresses(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,addressLine1: null == addressLine1 ? _self.addressLine1 : addressLine1 // ignore: cast_nullable_to_non_nullable
as String,addressLine2: freezed == addressLine2 ? _self.addressLine2 : addressLine2 // ignore: cast_nullable_to_non_nullable
as String?,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,zipCode: freezed == zipCode ? _self.zipCode : zipCode // ignore: cast_nullable_to_non_nullable
as String?,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,addressType: null == addressType ? _self.addressType : addressType // ignore: cast_nullable_to_non_nullable
as String,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as DateTime,dateLastModified: null == dateLastModified ? _self.dateLastModified : dateLastModified // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$UserSession {

 int get id; String get location; String get deviceIdentifier; String get ipAddress; String get userAgent; String get platform; String get osVersion; String get appVersion; String get deviceModel; DateTime get expiresAt; DateTime get createdAt;
/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSessionCopyWith<UserSession> get copyWith => _$UserSessionCopyWithImpl<UserSession>(this as UserSession, _$identity);

  /// Serializes this UserSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSession&&(identical(other.id, id) || other.id == id)&&(identical(other.location, location) || other.location == location)&&(identical(other.deviceIdentifier, deviceIdentifier) || other.deviceIdentifier == deviceIdentifier)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,location,deviceIdentifier,ipAddress,userAgent,platform,osVersion,appVersion,deviceModel,expiresAt,createdAt);

@override
String toString() {
  return 'UserSession(id: $id, location: $location, deviceIdentifier: $deviceIdentifier, ipAddress: $ipAddress, userAgent: $userAgent, platform: $platform, osVersion: $osVersion, appVersion: $appVersion, deviceModel: $deviceModel, expiresAt: $expiresAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $UserSessionCopyWith<$Res>  {
  factory $UserSessionCopyWith(UserSession value, $Res Function(UserSession) _then) = _$UserSessionCopyWithImpl;
@useResult
$Res call({
 int id, String location, String deviceIdentifier, String ipAddress, String userAgent, String platform, String osVersion, String appVersion, String deviceModel, DateTime expiresAt, DateTime createdAt
});




}
/// @nodoc
class _$UserSessionCopyWithImpl<$Res>
    implements $UserSessionCopyWith<$Res> {
  _$UserSessionCopyWithImpl(this._self, this._then);

  final UserSession _self;
  final $Res Function(UserSession) _then;

/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? location = null,Object? deviceIdentifier = null,Object? ipAddress = null,Object? userAgent = null,Object? platform = null,Object? osVersion = null,Object? appVersion = null,Object? deviceModel = null,Object? expiresAt = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,deviceIdentifier: null == deviceIdentifier ? _self.deviceIdentifier : deviceIdentifier // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,userAgent: null == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,osVersion: null == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,deviceModel: null == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSession].
extension UserSessionPatterns on UserSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSession value)  $default,){
final _that = this;
switch (_that) {
case _UserSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSession value)?  $default,){
final _that = this;
switch (_that) {
case _UserSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String location,  String deviceIdentifier,  String ipAddress,  String userAgent,  String platform,  String osVersion,  String appVersion,  String deviceModel,  DateTime expiresAt,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSession() when $default != null:
return $default(_that.id,_that.location,_that.deviceIdentifier,_that.ipAddress,_that.userAgent,_that.platform,_that.osVersion,_that.appVersion,_that.deviceModel,_that.expiresAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String location,  String deviceIdentifier,  String ipAddress,  String userAgent,  String platform,  String osVersion,  String appVersion,  String deviceModel,  DateTime expiresAt,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _UserSession():
return $default(_that.id,_that.location,_that.deviceIdentifier,_that.ipAddress,_that.userAgent,_that.platform,_that.osVersion,_that.appVersion,_that.deviceModel,_that.expiresAt,_that.createdAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String location,  String deviceIdentifier,  String ipAddress,  String userAgent,  String platform,  String osVersion,  String appVersion,  String deviceModel,  DateTime expiresAt,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _UserSession() when $default != null:
return $default(_that.id,_that.location,_that.deviceIdentifier,_that.ipAddress,_that.userAgent,_that.platform,_that.osVersion,_that.appVersion,_that.deviceModel,_that.expiresAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSession implements UserSession {
  const _UserSession({required this.id, required this.location, required this.deviceIdentifier, required this.ipAddress, required this.userAgent, required this.platform, required this.osVersion, required this.appVersion, required this.deviceModel, required this.expiresAt, required this.createdAt});
  factory _UserSession.fromJson(Map<String, dynamic> json) => _$UserSessionFromJson(json);

@override final  int id;
@override final  String location;
@override final  String deviceIdentifier;
@override final  String ipAddress;
@override final  String userAgent;
@override final  String platform;
@override final  String osVersion;
@override final  String appVersion;
@override final  String deviceModel;
@override final  DateTime expiresAt;
@override final  DateTime createdAt;

/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSessionCopyWith<_UserSession> get copyWith => __$UserSessionCopyWithImpl<_UserSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSession&&(identical(other.id, id) || other.id == id)&&(identical(other.location, location) || other.location == location)&&(identical(other.deviceIdentifier, deviceIdentifier) || other.deviceIdentifier == deviceIdentifier)&&(identical(other.ipAddress, ipAddress) || other.ipAddress == ipAddress)&&(identical(other.userAgent, userAgent) || other.userAgent == userAgent)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion)&&(identical(other.appVersion, appVersion) || other.appVersion == appVersion)&&(identical(other.deviceModel, deviceModel) || other.deviceModel == deviceModel)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,location,deviceIdentifier,ipAddress,userAgent,platform,osVersion,appVersion,deviceModel,expiresAt,createdAt);

@override
String toString() {
  return 'UserSession(id: $id, location: $location, deviceIdentifier: $deviceIdentifier, ipAddress: $ipAddress, userAgent: $userAgent, platform: $platform, osVersion: $osVersion, appVersion: $appVersion, deviceModel: $deviceModel, expiresAt: $expiresAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$UserSessionCopyWith<$Res> implements $UserSessionCopyWith<$Res> {
  factory _$UserSessionCopyWith(_UserSession value, $Res Function(_UserSession) _then) = __$UserSessionCopyWithImpl;
@override @useResult
$Res call({
 int id, String location, String deviceIdentifier, String ipAddress, String userAgent, String platform, String osVersion, String appVersion, String deviceModel, DateTime expiresAt, DateTime createdAt
});




}
/// @nodoc
class __$UserSessionCopyWithImpl<$Res>
    implements _$UserSessionCopyWith<$Res> {
  __$UserSessionCopyWithImpl(this._self, this._then);

  final _UserSession _self;
  final $Res Function(_UserSession) _then;

/// Create a copy of UserSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? location = null,Object? deviceIdentifier = null,Object? ipAddress = null,Object? userAgent = null,Object? platform = null,Object? osVersion = null,Object? appVersion = null,Object? deviceModel = null,Object? expiresAt = null,Object? createdAt = null,}) {
  return _then(_UserSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,deviceIdentifier: null == deviceIdentifier ? _self.deviceIdentifier : deviceIdentifier // ignore: cast_nullable_to_non_nullable
as String,ipAddress: null == ipAddress ? _self.ipAddress : ipAddress // ignore: cast_nullable_to_non_nullable
as String,userAgent: null == userAgent ? _self.userAgent : userAgent // ignore: cast_nullable_to_non_nullable
as String,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,osVersion: null == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String,appVersion: null == appVersion ? _self.appVersion : appVersion // ignore: cast_nullable_to_non_nullable
as String,deviceModel: null == deviceModel ? _self.deviceModel : deviceModel // ignore: cast_nullable_to_non_nullable
as String,expiresAt: null == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
