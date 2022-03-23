import 'package:dormitory_app/src/constants/asset.dart';
import 'package:dormitory_app/src/constants/dorm.dart';
import 'package:dormitory_app/src/screens/bil/bil_screen.dart';
import 'package:dormitory_app/src/screens/house_information/house_information_screen.dart';
import 'package:dormitory_app/src/screens/login/login_screen.dart';
import 'package:dormitory_app/src/screens/new_post/new_posts_screen.dart';
import 'package:dormitory_app/src/screens/renter/renter_screen.dart';
import 'package:dormitory_app/src/utils/localStorageApp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/getx_controller.dart';
import '../promise/promise_screen.dart';

final controller = Get.put(Controller());

class MenuApp extends StatefulWidget {
  const MenuApp({Key? key}) : super(key: key);

  @override
  State<MenuApp> createState() => _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {
  _logout() async {
    controller.logout();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
    await LocalStorageApp.storageApp.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset(Asset.HOME_IMAGE),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 20),
              alignment: Alignment.center,
              child: Text(
                Dorm.DORM_NAME,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  // debugPrint('ข้อมูลหอพัก');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HouseInFormationScreen(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.home, color: Colors.deepOrange),
                  title: Text('ข้อมูลหอพัก'),
                ),
              ),
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  // debugPrint('ข้อมูลสัญญาเช่า');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PromiseScreen(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.assignment, color: Colors.deepOrange),
                  title: Text('ข้อมูลสัญญาเช่า'),
                ),
              ),
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BilScreen(),
                    ),
                  );
                },
                child: ListTile(
                  leading:
                      Icon(Icons.document_scanner, color: Colors.deepOrange),
                  title: Text('บิลค่าเช่า'),
                ),
              ),
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  debugPrint('ข่าวสาร');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewPostScreen(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.article, color: Colors.deepOrange),
                  title: Text('ข่าวสาร'),
                ),
              ),
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  debugPrint('ข้อมูลสัญญาเช่า');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RenterScreen(),
                    ),
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.person, color: Colors.deepOrange),
                  title: Text('ข้อมูลผู้เช่า'),
                ),
              ),
            ),
            Card(
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  _logout();
                },
                child: ListTile(
                  leading: Icon(Icons.logout, color: Colors.deepOrange),
                  title: Text('ออกจากระบบ'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
