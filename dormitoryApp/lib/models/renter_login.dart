import 'package:json_annotation/json_annotation.dart';


part 'renter_login.g.dart';

@JsonSerializable()
class RenterLogin {
  RenterLogin({
this.status,
this.message,
this.error,
this.rid,
this.rName,
this.rTel,
this.rIdcard,
this.rAdd,
this.rEmail,
this.username,
this.leasesId,
this.roomId,
this.leasesDate,
this.expiresDate,
this.lCE,
this.lCW,
this.lRent,
});
      
  factory RenterLogin.fromJson(Map<String,dynamic> json) => _$RenterLoginFromJson(json);
  Map<String, dynamic> toJson() => _$RenterLoginToJson(this);
  int? status;
  String? message;
  bool? error;
  String? rid;
  @JsonKey(name: 'r_name') String? rName;
  @JsonKey(name: 'r_tel') String? rTel;
  @JsonKey(name: 'r_idcard') String? rIdcard;
  @JsonKey(name: 'r_add') String? rAdd;
  @JsonKey(name: 'r_email') String? rEmail;
  String? username;
  @JsonKey(name: 'leases_id') String? leasesId;
  @JsonKey(name: 'room_id') String? roomId;
  @JsonKey(name: 'leases_date') String? leasesDate;
  @JsonKey(name: 'expires_date') String? expiresDate;
  @JsonKey(name: 'l_c_e') String? lCE;
  @JsonKey(name: 'l_c_w') String? lCW;
  @JsonKey(name: 'l_rent') String? lRent;
}
