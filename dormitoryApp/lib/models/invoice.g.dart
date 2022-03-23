// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Invoice _$InvoiceFromJson(Map<String, dynamic> json) {
  return Invoice(
    leasesId: json['leases_id'] as String?,
    invoiceId: json['invoice_id'] as String?,
    aid: json['aid'] as String?,
    invoiceDate: json['invoice_date'] as String?,
    metersWnew: json['meters_wnew'] as String?,
    metersLnew: json['meters_lnew'] as String?,
    waterUnit: json['water_unit'] as String?,
    lightUnit: json['light_unit'] as String?,
    totalWprice: json['total_wprice'] as String?,
    totalLprice: json['total_lprice'] as String?,
    netTotal: json['net_total'] as String?,
    invoiceStatus: json['Invoice_status'] as String?,
    invoiceMonth: json['invoice_month'] as String?,
    payId: json['pay_id'] as String?,
    rid: json['rid'] as String?,
    roomId: json['room_id'] as String?,
    leasesDate: json['leases_date'] as String?,
    expiresDate: json['expires_date'] as String?,
    leasesStatus: json['leases_status'] as String?,
    lCE: json['l_c_e'] as String?,
    lCW: json['l_c_w'] as String?,
    lRent: json['l_rent'] as String?,
  );
}

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'leases_id': instance.leasesId,
      'invoice_id': instance.invoiceId,
      'aid': instance.aid,
      'invoice_date': instance.invoiceDate,
      'meters_wnew': instance.metersWnew,
      'meters_lnew': instance.metersLnew,
      'water_unit': instance.waterUnit,
      'light_unit': instance.lightUnit,
      'total_wprice': instance.totalWprice,
      'total_lprice': instance.totalLprice,
      'net_total': instance.netTotal,
      'Invoice_status': instance.invoiceStatus,
      'invoice_month': instance.invoiceMonth,
      'pay_id': instance.payId,
      'rid': instance.rid,
      'room_id': instance.roomId,
      'leases_date': instance.leasesDate,
      'expires_date': instance.expiresDate,
      'leases_status': instance.leasesStatus,
      'l_c_e': instance.lCE,
      'l_c_w': instance.lCW,
      'l_rent': instance.lRent,
    };
