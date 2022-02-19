import 'package:futsal_app/controllers/auth_c.dart';
import 'package:futsal_app/controllers/menu_c.dart';
import 'package:get/get.dart';

class MenuBind implements Bindings {
  @override
  void dependencies() {
    Get.put(MenuC());
  }
}
