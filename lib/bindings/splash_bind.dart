import 'package:futsal_app/controllers/splash_c.dart';
import 'package:get/get.dart';

class SplashBind extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashC());
  }
}
