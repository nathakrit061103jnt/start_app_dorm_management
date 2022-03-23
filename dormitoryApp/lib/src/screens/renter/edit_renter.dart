import 'package:dormitory_app/models/index.dart';
import 'package:dormitory_app/src/screens/bil/bil_screen.dart';
import 'package:dormitory_app/src/screens/home/home_screen.dart';
import 'package:dormitory_app/src/screens/renter/renter_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/api.dart';

import 'package:flutter/cupertino.dart';

import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import '../../controllers/getx_controller.dart';
import 'package:http/http.dart' as http;

import '../../utils/localStorageApp.dart';
import 'package:get/get.dart';

final _renterData = LocalStorageApp.storageApp.getItem('renterDetail');
final controller = Get.put(Controller());

class EditRenter extends StatefulWidget {
  final renterPayload;

  const EditRenter(Map<String, dynamic> this.renterPayload, {Key? key})
      : super(key: key);

  @override
  State<EditRenter> createState() => _EditRenterState(renterPayload);
}

class _EditRenterState extends State<EditRenter> {
  final renterPayload;

  _EditRenterState(this.renterPayload);

  Future<RenterUpdate>? _futureRenterupdate;

  var _formKey = GlobalKey<FormState>();

  var _rName;

  var _nameController = TextEditingController(
      text: '${controller.renterGetX["r_name"].toString()}');

  final _telController =
      TextEditingController(text: '${controller.renterGetX["r_tel"]}');
  var _idCardController =
      TextEditingController(text: '${controller.renterGetX["r_idcard"]}');
  var _addressController =
      TextEditingController(text: '${controller.renterGetX["r_add"]}');
  var _emailController =
      TextEditingController(text: '${controller.renterGetX["r_email"]}');
  var _uernameController =
      TextEditingController(text: '${controller.renterGetX["username"]}');

  final _rId = renter["rid"].toString();

  Future<RenterUpdate> updateRenter(dynamic payload) async {
    final response = await http.post(
      Uri.parse(API.UPDATE_RENTER),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(payload),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      // debugPrint(response.body);

      await LocalStorageApp.storageApp.setItem('renterDetail', payload);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RenterScreen(),
        ),
      );

      return RenterUpdate.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ไม่สามารถเเก้ไขข้อมูลได้'),
        ),
      );
      throw Exception('Failed to update renter.');
    }
  }

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      // debugPrint(_nameController.text);
      // debugPrint(_idCardController.text);
      // debugPrint(_addressController.text);
      // debugPrint(_emailController.text);
      // print(_uernameController.text);
      // print(_rId);

      var _payload = {
        "rid": _rId,
        "r_name": _nameController.text,
        "r_tel": _telController.text,
        "r_idcard": _idCardController.text,
        "r_add": _addressController.text,
        "r_email": _emailController.text,
        "username": _uernameController.text
      };

      _futureRenterupdate = updateRenter(_payload);

      // print(_payload);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('เเก้ไขข้อมูลสำเร็จ'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // print('controller r_tel ${controller.renterGetX["r_tel"] }');
    // print(_renterData);
    return MaterialApp(
      title: 'เเก้ไขข้อมูลผู้เช่า',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('เเก้ไขข้อมูลผู้เช่า'),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.article,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  child: Text(
                    'เเก้ไขข้อมูลผู้เช่า',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.deepOrange),
                  ),
                  alignment: Alignment.center,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: TextFormField(
                    readOnly: true,
                    initialValue: _rId,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ไอดีผู้เช่า',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextFormField(
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอก ชื่อ-สกุล ผู้เช่า';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ชื่อ-สกุล ผู้เช่า',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextFormField(
                    controller: _telController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอก เบอร์โทรศัพท์ ผู้เช่า';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'เบอร์โทรศัพท์ ผู้เช่า',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextFormField(
                    controller: _idCardController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอก เลขที่บัตรประชาชน';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'เลขที่บัตรประชาชน',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextFormField(
                    controller: _addressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอก ที่อยู่ผู้เช่า';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ที่อยู่',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอก อีเมลผู้เช่า';
                      }
                      // if (value.isEmail) {
                      //   return 'กรุณากรอก อีเมลผู้เช่า';
                      // }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'อีเมลผู้เช่า',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextFormField(
                    controller: _uernameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'กรุณากรอกชื่อผู้ใช้งาน username';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ชื่อผู้ใช้งาน (Username)',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pop(context);
                      _submitForm();
                    },
                    child: Text("เเก้ไข"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
