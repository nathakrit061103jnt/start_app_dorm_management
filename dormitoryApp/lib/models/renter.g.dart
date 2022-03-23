// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Renter _$RenterFromJson(Map<String, dynamic> json) {
  return Renter(
    rid: json['rid'] as String?,
    rName: json['r_name'] as String?,
    rTel: json['r_tel'] as String?,
    rIdcard: json['r_idcard'] as String?,
    rAdd: json['r_add'] as String?,
    rEmail: json['r_email'] as String?,
    username: json['username'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$RenterToJson(Renter instance) => <String, dynamic>{
      'rid': instance.rid,
      'r_name': instance.rName,
      'r_tel': instance.rTel,
      'r_idcard': instance.rIdcard,
      'r_add': instance.rAdd,
      'r_email': instance.rEmail,
      'username': instance.username,
      'password': instance.password,
    };
