// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renter_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenterLogin _$RenterLoginFromJson(Map<String, dynamic> json) {
  return RenterLogin(
    status: json['status'] as int?,
    message: json['message'] as String?,
    error: json['error'] as bool?,
    rid: json['rid'] as String?,
    rName: json['r_name'] as String?,
    rTel: json['r_tel'] as String?,
    rIdcard: json['r_idcard'] as String?,
    rAdd: json['r_add'] as String?,
    rEmail: json['r_email'] as String?,
    username: json['username'] as String?,
    leasesId: json['leases_id'] as String?,
    roomId: json['room_id'] as String?,
    leasesDate: json['leases_date'] as String?,
    expiresDate: json['expires_date'] as String?,
    lCE: json['l_c_e'] as String?,
    lCW: json['l_c_w'] as String?,
    lRent: json['l_rent'] as String?,
  );
}

Map<String, dynamic> _$RenterLoginToJson(RenterLogin instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'error': instance.error,
      'rid': instance.rid,
      'r_name': instance.rName,
      'r_tel': instance.rTel,
      'r_idcard': instance.rIdcard,
      'r_add': instance.rAdd,
      'r_email': instance.rEmail,
      'username': instance.username,
      'leases_id': instance.leasesId,
      'room_id': instance.roomId,
      'leases_date': instance.leasesDate,
      'expires_date': instance.expiresDate,
      'l_c_e': instance.lCE,
      'l_c_w': instance.lCW,
      'l_rent': instance.lRent,
    };
