import 'dart:async';
import 'dart:convert';

import 'package:dormitory_app/models/index.dart';
import 'package:dormitory_app/src/screens/renter/edit_renter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../../constants/api.dart';

import '../../controllers/getx_controller.dart';
import '../../utils/localStorageApp.dart';

final _renterLogin = LocalStorageApp.storageApp.getItem('loginRenter');

final controller = Get.put(Controller());

Future<Renter> fetchRenter() async {
  final _rid = _renterLogin['rid'].toString();
  final apiUrl = '${API.RENTER}?rid=${_rid}';
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    controller.setRenterGetx(jsonDecode(response.body));
    // print(jsonDecode(response.body).runtimeType);
    await LocalStorageApp.storageApp.deleteItem('renterDetail');
    await LocalStorageApp.storageApp
        .setItem('renterDetail', jsonDecode(response.body));
    return Renter.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load renter');
  }
}

class RenterScreen extends StatefulWidget {
  const RenterScreen({Key? key}) : super(key: key);

  @override
  _RenterScreenState createState() => _RenterScreenState();
}

class _RenterScreenState extends State<RenterScreen> {
  late Future<Renter> futureRenter;
  final _title = "ข้อมูลผู้เช่า";

  @override
  Widget build(BuildContext context) {
    futureRenter = fetchRenter();
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ข้อมูลผู้เช่า'),
        ),
        body: Center(
          child: FutureBuilder<Renter>(
            future: futureRenter,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // return Text(snapshot.data!.rIdcard.toString());
                return _RenterWidget(snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget _RenterWidget(snapshot) {
    // print(snapshot.rid);
    final renterPayload = {
      "rid": "6",
      "r_name": "a nam5555 ttttttttttttttttttt",
      "r_tel": "000-00236",
      "r_idcard": "id crad",
      "r_add": "renter address",
      "r_email": "email",
      "username": "a",
    };
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
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
              'ข้อมูลผู้เช่า',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 200.0,
                      child: Text(
                        "ไอดีผู้เช่า",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(snapshot.rid.toString()),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const SizedBox(
                      width: 200.0,
                      child: Text(
                        "ชื่อ-สกุล",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(snapshot.rName.toString()),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const SizedBox(
                      width: 200.0,
                      child: Text(
                        "เบอร์โทรศัพท์",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(snapshot.rTel.toString()),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const SizedBox(
                      width: 200.0,
                      child: Text(
                        "อีเมล",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(snapshot.rEmail.toString()),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const SizedBox(
                      width: 200.0,
                      child: Text(
                        "เลขบัตรประชาชน",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(snapshot.rIdcard.toString()),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const SizedBox(
                      width: 200.0,
                      child: Text(
                        "ที่อยู่",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(snapshot.rAdd.toString()),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const SizedBox(
                      width: 200.0,
                      child: Text(
                        "ชื่อผู้ใช้งาน (Username)",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(snapshot.username.toString()),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditRenter(renterPayload),
                      ),
                    );
                    // debugPrint('edit');
                    LocalStorageApp.storageApp
                        .setItem('renterDetail', renterPayload);
                  },
                  child: const Text('เเก้ไขข้อมูล'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
