import 'package:get/get.dart';

class Controller extends GetxController {
  var count = 540;

  late Map<String, dynamic> renterGetX;
  var renterLoginGetX;

  void setRenterGetx(Map<String, dynamic> payload) {
    renterGetX = payload;
    update();
  }

  void setRenterLoginGetx(payload) {
    renterLoginGetX = payload;
    update();
  }

  void logout() {
    renterGetX = {};
    renterLoginGetX = {};
    update();
  }

  getRenterGetx() {}

  void increment() {
    renterGetX = {};
    update();
  }
}
