import 'package:dormitory_app/src/utils/localStorageApp.dart';
import 'package:flutter/material.dart';

class PromiseScreen extends StatelessWidget {
  const PromiseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final promise = LocalStorageApp.storageApp.getItem('loginRenter');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ข้อมูลสัญญาเช่า'),
        ),
        body: Container(
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
                  Icons.assignment,
                  size: 100,
                  color: Colors.grey,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
                child: Text(
                  'ข้อมูลสัญญาเช่า',
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
                            "เลขที่สัญญาเช่า",
                            style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text("${promise['leases_id'].toString()}"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const SizedBox(
                          width: 200.0,
                          child: Text(
                            "หมายเลขห้องพัก",
                            style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text("${promise['room_id'].toString()}"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const SizedBox(
                          width: 200.0,
                          child: Text(
                            "วันที่ทำสัญญา",
                            style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text("${promise['leases_date'].toString()}"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const SizedBox(
                          width: 200.0,
                          child: Text(
                            "วันที่หมดสัญญา",
                            style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text("${promise['expires_date'].toString()}"),
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
                          child: Text(
                            "${promise['r_add'].toString()}",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const SizedBox(
                          width: 200.0,
                          child: Text(
                            "ค่าไฟฟ้าต่อหน่วย",
                            style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child:
                              Text("${promise['l_c_e'].toString()} บาท/หน่วย"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const SizedBox(
                          width: 200.0,
                          child: Text(
                            "ค่าน้ำต่อหน่วย",
                            style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child:
                              Text("${promise['l_c_w'].toString()} บาท/หน่วย"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const SizedBox(
                          width: 200.0,
                          child: Text(
                            "ค่าเช่า",
                            style: const TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child:
                              Text("${promise['l_rent'].toString()} บาท/เดือน"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
