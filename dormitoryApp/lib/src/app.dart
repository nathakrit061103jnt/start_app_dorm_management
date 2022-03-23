import 'package:dormitory_app/src/screens/home/home_screen.dart';
import 'package:dormitory_app/src/screens/login/login_screen.dart';
import 'package:dormitory_app/src/utils/LocalStorageApp.dart';
import 'package:flutter/material.dart';



class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dorm Management App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Material App Bar'),
        // ),
        body: FutureBuilder(
            future: LocalStorageApp.storageApp.ready,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var isRenterLogin = LocalStorageApp.storageApp.getItem(
                    'isRenterLogin');
                // print(isRenterLogin);
                if (isRenterLogin != null && isRenterLogin) {
                  return HomeScreen();
                }
                return LoginScreen();
              }
              return SizedBox();
            }),
        // ),
      ),
    );
  }
}
