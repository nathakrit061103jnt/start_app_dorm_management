import 'package:json_annotation/json_annotation.dart';

part 'renter.g.dart';

@JsonSerializable()
class Renter {
  Renter({
    this.rid,
    this.rName,
    this.rTel,
    this.rIdcard,
    this.rAdd,
    this.rEmail,
    this.username,
    this.password,
  });

  factory Renter.fromJson(Map<String, dynamic> json) => _$RenterFromJson(json);

  Map<String, dynamic> toJson() => _$RenterToJson(this);
  String? rid;
  @JsonKey(name: 'r_name')
  String? rName;
  @JsonKey(name: 'r_tel')
  String? rTel;
  @JsonKey(name: 'r_idcard')
  String? rIdcard;
  @JsonKey(name: 'r_add')
  String? rAdd;
  @JsonKey(name: 'r_email')
  String? rEmail;
  String? username;
  String? password;
}
