// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renter_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenterUpdate _$RenterUpdateFromJson(Map<String, dynamic> json) {
  return RenterUpdate(
    rid: json['rid'] as String?,
    rName: json['r_name'] as String?,
    rTel: json['r_tel'] as String?,
    rIdcard: json['r_idcard'] as String?,
    rAdd: json['r_add'] as String?,
    rEmail: json['r_email'] as String?,
    username: json['username'] as String?,
  );
}

Map<String, dynamic> _$RenterUpdateToJson(RenterUpdate instance) =>
    <String, dynamic>{
      'rid': instance.rid,
      'r_name': instance.rName,
      'r_tel': instance.rTel,
      'r_idcard': instance.rIdcard,
      'r_add': instance.rAdd,
      'r_email': instance.rEmail,
      'username': instance.username,
    };
