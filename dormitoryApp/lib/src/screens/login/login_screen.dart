import 'package:dormitory_app/models/renter_login.dart';
import 'package:dormitory_app/src/constants/api.dart';
import 'package:dormitory_app/src/screens/home/home_screen.dart';
import 'package:dormitory_app/src/utils/localStorageApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dormitory_app/src/constants/asset.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../constants/asset.dart';
import 'package:dormitory_app/src/controllers/getx_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final controller = Get.put(Controller());

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
        ),
      ),
      home: Scaffold(
        body: Container(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Image(
                  height: 330,
                  // width: 50,
                  image: AssetImage(Asset.LOGIN_IMAGE),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: const LoginForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _uernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<RenterLogin> loginRenter(dynamic payload) async {
    final response = await http.post(
      Uri.parse(API.LOGIN_RENTER),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(payload),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      // print(result);
      LocalStorageApp.storageApp.setItem('loginRenter', result);
      LocalStorageApp.storageApp.setItem('isRenterLogin', true);
      controller.setRenterLoginGetx(result);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('เข้าสู่ระบบ'),
        ),
      );

      return RenterLogin.fromJson(jsonDecode(response.body));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('ชื่อผู้ใช้งาน (Username) หรือ รหัสผ่านไม่ถูกต้อง'),
        ),
      );
      throw Exception('Failed to login renter.');
    }
  }

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      // print(_uernameController.text);
      // print(_passwordController.text);

      final payload = {
        "username": _uernameController.text,
        "password": _passwordController.text
      };

      loginRenter(payload);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: const Text(
                'เข้าสู่ระบบ',
                style: const TextStyle(
                  color: Colors.deepOrangeAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
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
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกรหัสผ่าน';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'รหัสผ่าน',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                    child: SizedBox(
                      height: 50,
                      // width: 460,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                              Size.fromWidth(500)),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepOrangeAccent),
                        ),
                        onPressed: () => {_submitForm()},
                        child: Text("เข้าสู่ระบบ"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
