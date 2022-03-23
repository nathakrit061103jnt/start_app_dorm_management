import 'package:dormitory_app/src/constants/asset.dart';
import 'package:dormitory_app/src/constants/dorm.dart';
import 'package:flutter/material.dart';

class HouseInFormationScreen extends StatefulWidget {
  const HouseInFormationScreen({Key? key}) : super(key: key);

  @override
  State<HouseInFormationScreen> createState() => _HouseInFormationScreenState();
}

class _HouseInFormationScreenState extends State<HouseInFormationScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ข้อมูลหอพัก',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('ข้อมูลหอพัก'),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                alignment: Alignment.center,
                child: Image.asset(Asset.HOME_IMAGE),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 30),
                alignment: Alignment.center,
                child: Text(
                  Dorm.DORM_NAME,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      alignment: Alignment.center,
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: Icon(
                                Icons.home,
                                color: Colors.deepOrange,
                              ),
                              title: Text('ที่อยู่หอพัก'),
                              subtitle: Text(Dorm.DORM_ADDRESS),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      alignment: Alignment.center,
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const ListTile(
                              leading: Icon(
                                Icons.phone,
                                color: Colors.deepOrange,
                              ),
                              title: Text('เบอร์โทรศัพท์ติดต่อ'),
                              subtitle:
                                  Text("${Dorm.DORM_TEl} ${Dorm.DORM_Owner}"),
                            ),
                          ],
                        ),
                      ),
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
