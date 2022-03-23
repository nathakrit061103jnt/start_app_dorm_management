import 'package:json_annotation/json_annotation.dart';


part 'invoice.g.dart';

@JsonSerializable()
class Invoice {
  Invoice({
this.leasesId,
this.invoiceId,
this.aid,
this.invoiceDate,
this.metersWnew,
this.metersLnew,
this.waterUnit,
this.lightUnit,
this.totalWprice,
this.totalLprice,
this.netTotal,
this.invoiceStatus,
this.invoiceMonth,
this.payId,
this.rid,
this.roomId,
this.leasesDate,
this.expiresDate,
this.leasesStatus,
this.lCE,
this.lCW,
this.lRent,
});
      
  factory Invoice.fromJson(Map<String,dynamic> json) => _$InvoiceFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
  @JsonKey(name: 'leases_id') String? leasesId;
  @JsonKey(name: 'invoice_id') String? invoiceId;
  String? aid;
  @JsonKey(name: 'invoice_date') String? invoiceDate;
  @JsonKey(name: 'meters_wnew') String? metersWnew;
  @JsonKey(name: 'meters_lnew') String? metersLnew;
  @JsonKey(name: 'water_unit') String? waterUnit;
  @JsonKey(name: 'light_unit') String? lightUnit;
  @JsonKey(name: 'total_wprice') String? totalWprice;
  @JsonKey(name: 'total_lprice') String? totalLprice;
  @JsonKey(name: 'net_total') String? netTotal;
  @JsonKey(name: 'Invoice_status') String? invoiceStatus;
  @JsonKey(name: 'invoice_month') String? invoiceMonth;
  @JsonKey(name: 'pay_id') String? payId;
  String? rid;
  @JsonKey(name: 'room_id') String? roomId;
  @JsonKey(name: 'leases_date') String? leasesDate;
  @JsonKey(name: 'expires_date') String? expiresDate;
  @JsonKey(name: 'leases_status') String? leasesStatus;
  @JsonKey(name: 'l_c_e') String? lCE;
  @JsonKey(name: 'l_c_w') String? lCW;
  @JsonKey(name: 'l_rent') String? lRent;
}
