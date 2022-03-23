import 'package:json_annotation/json_annotation.dart';


part 'renter_update.g.dart';

@JsonSerializable()
class RenterUpdate {
  RenterUpdate({
this.rid,
this.rName,
this.rTel,
this.rIdcard,
this.rAdd,
this.rEmail,
this.username,
});
      
  factory RenterUpdate.fromJson(Map<String,dynamic> json) => _$RenterUpdateFromJson(json);
  Map<String, dynamic> toJson() => _$RenterUpdateToJson(this);
  String? rid;
  @JsonKey(name: 'r_name') String? rName;
  @JsonKey(name: 'r_tel') String? rTel;
  @JsonKey(name: 'r_idcard') String? rIdcard;
  @JsonKey(name: 'r_add') String? rAdd;
  @JsonKey(name: 'r_email') String? rEmail;
  String? username;
}
