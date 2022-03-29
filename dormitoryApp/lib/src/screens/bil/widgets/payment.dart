import 'dart:io';

import 'package:dormitory_app/models/invoice.dart';
import 'package:dormitory_app/src/screens/bil/bil_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/api.dart';
import '../../../constants/dorm.dart';
import '../../../controllers/getx_controller.dart';

import 'dart:convert' as convert;

import 'dart:async';
import 'package:http/http.dart' as http;

final controller = Get.put(Controller());

class Payment extends StatefulWidget {
  final Invoice invoice;

  const Payment(Invoice this.invoice, {Key? key}) : super(key: key);

  // final imgUploadFile =  TextEditingController( );

  @override
  State<Payment> createState() => _PaymentState(invoice);
}

class _PaymentState extends State<Payment> {
  final Invoice invoice;
  final _title = "ข้อมูลบิลค่าเช่า";
  var base64Image;
  var uploadimage;

  var image; //variable for choosed file
  _PaymentState(Invoice this.invoice, {this.uploadimage});

  final ImagePicker _picker = ImagePicker();

  paymentApi() async {
    final bytes = File(image!.path).readAsBytesSync();
    base64Image = convert.base64Encode(bytes);
    // print("imgbytes : $base64Image");

    debugPrint('จ่ายเงิน');
    // print(image);

    var _payload = {
      "invoice_id": this.invoice.invoiceId,
      "leases_id": this.invoice.leasesId,
      "room_id": this.invoice.roomId,
      "pay_total": this.invoice.netTotal,
      "image": base64Image
    };

    print(_payload);
    //
    // final response = await http.post(
    //   Uri.parse(API.PAYMENT_API),
    //   headers: <String, String>{
    //     'Content-Type': 'application/json; charset=UTF-8',
    //   },
    //   body: convert.json.encode(_payload),
    // );

    // if (response.statusCode == 200) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => BilScreen(),
    //     ),
    //   );
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('ไม่สามารถชำระค่าเช่าได้'),
    //     ),
    //   );
    //   throw Exception('Failed to update renter.');
    // }
  }

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
          margin: EdgeInsets.fromLTRB(30, 60, 30, 0),
          child: ListView(
            children: [
              Ink(
                decoration: const ShapeDecoration(
                  color: Colors.lightBlue,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.file_upload),
                  color: Colors.white,
                  onPressed: () async {
                    image =
                        await _picker.pickImage(source: ImageSource.gallery);

                    setState(() {});
                  },
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 15, 0, 20),
                child: Text(
                  'อัปโหลดไฟล์ภาพการชำระค่าเช่า',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontSize: 14),
                ),
              ),
              // _selectImage(invoice),
              (image != null)
                  ? Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Image.file(File(image!.path)),
                    )
                  : Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: Text(
                        "No Image",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
              Center(
                child: Card(
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      debugPrint('Card tapped.');
                    },
                    child: SizedBox(
                      width: 300,
                      height: 100,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(25, 15, 0, 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'ธนาคาร',
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(Dorm.DORM_BANK_NAME),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  'เลขที่บัญชีธนาคาร',
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(Dorm.DORM_BANK_ACCOUNT_NO),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  'ชื่อ-สกุล',
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(Dorm.DORM_BANK_ACCOUNT_NAME),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                child: Text(
                  'รายละเอียดบิลค่าเช่า',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 22,
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
              (image != null) ? _PaymentButton(invoice, context) : SizedBox(),
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

  _debugImageBase64(img) {
    print(img);
  }

  Widget _imageShow() {
    if (image != null) {
      return Container(
        child: Card(
          child: Image.file(File(image!.path)),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buttonUploadImg() {
    return Center(
      child: Column(
        children: [
          Ink(
            decoration: const ShapeDecoration(
              color: Colors.lightBlue,
              shape: CircleBorder(),
            ),
            child: IconButton(
              icon: const Icon(Icons.file_upload),
              color: Colors.white,
              onPressed: () {},
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.fromLTRB(0, 15, 0, 20),
            child: Text(
              'อัปโหลดไฟล์ภาพการชำระค่าเช่า',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Future<Widget> _selectImage(invoice) async {
    if (invoice.payId == 0 || invoice.payId == "0") {
      //   (image != null) ?  Image.file(File(image!.path)) : Text("Not fount")
      if (image != null) {
        return Container(
          child: Card(
            child: Image.file(File(image!.path)),
          ),
        );
      } else {
        return Column(
          children: [
            Ink(
              decoration: const ShapeDecoration(
                color: Colors.lightBlue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(Icons.file_upload),
                color: Colors.white,
                onPressed: () async {
                  image = await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 15, 0, 20),
              child: Text(
                'อัปโหลดไฟล์ภาพการชำระค่าเช่า',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                    fontSize: 14),
              ),
            ),
          ],
        );
      }
    } else {
      return Container();
    }
  }

  Widget _PaymentButton(invoice, context) {
    if (invoice.payId == 0 || invoice.payId == "0") {
      return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),
        ),
        onPressed: () async {
          paymentApi();
        },
        child: Text('ชำระค่าเช่า'),
      );
    } else {
      return Container();
    }
  }
}
