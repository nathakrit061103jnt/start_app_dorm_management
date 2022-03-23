import 'package:dormitory_app/models/invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../controllers/getx_controller.dart';

import 'dart:convert' as convert;
import 'dart:async';

final controller = Get.put(Controller());

class BilDetail extends StatefulWidget {
  final Invoice invoice;

  const BilDetail(Invoice this.invoice, {Key? key}) : super(key: key);

  // final imgUploadFile =  TextEditingController( );

  @override
  State<BilDetail> createState() => _BilDetailState(invoice);
}

class _BilDetailState extends State<BilDetail> {
  final Invoice invoice;
  final _title = "ข้อมูลบิลค่าเช่า";

  var uploadimage;

  var image; //variable for choosed file
  _BilDetailState(Invoice this.invoice, {this.uploadimage});

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                alignment: Alignment.center,
                child: Icon(
                  Icons.article,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                child: Text(
                  'รายละเอียดบิลค่าเช่า',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'หมายเลขบิลค่าเช่า',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      invoice.invoiceId.toString(),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'มิเตอร์น้ำปัจจุบัน',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 66,
                    ),
                    Text(
                      '${invoice.metersWnew.toString()} หน่วย',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'มิเตอร์ไฟฟ้าปัจจุบัน',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    Text(
                      '${invoice.metersLnew.toString()} หน่วย',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'จำนวนน้ำที่ใช้',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 84,
                    ),
                    Text(
                      '${invoice.waterUnit.toString()} หน่วย',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'จำนวนไฟฟ้าที่ใช้',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 64,
                    ),
                    Text(
                      '${invoice.lightUnit.toString()} หน่วย',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'รวมค่าน้ำ',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 115,
                    ),
                    Text(
                      '${invoice.totalWprice.toString()} บาท',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'รวมค่าไฟฟ้า',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 95,
                    ),
                    Text(
                      '${invoice.totalLprice.toString()} บาท',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'รวมค่าเช่าสุทธิ',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 77,
                    ),
                    Text(
                      '${invoice.netTotal.toString()} บาท',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'สถานะบิล',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 110,
                    ),
                    _TextStatus(invoice),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'เลขที่สัญญาเช่า',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 69,
                    ),
                    Text(
                      '${invoice.leasesId.toString()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'บิลของเดือน',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 92,
                    ),
                    Text(
                      '${invoice.invoiceDate.toString()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _TextStatus(invoice) {
    // print(payId.runtimeType);
    // print(payId);
    if (invoice.invoiceStatus == 0 || invoice.invoiceStatus == "0") {
      return Text(
        'ยังไม่ชำระ',
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
        ),
      );
    } else if (invoice.invoiceStatus == 1 || invoice.invoiceStatus == "1") {
      return Text(
        'รอการยืนยัน',
        style: TextStyle(
          color: Colors.amber,
          fontSize: 16,
        ),
      );
    } else {
      return Text(
        'ชำระเเล้ว',
        style: TextStyle(
          color: Colors.green,
          fontSize: 16,
        ),
      );
    }
  }
}
