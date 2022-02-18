import 'package:futsal_app/routes/routes_name.dart';
import 'package:get/get.dart';

class SplashC extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(AppRoutesName.dashboard);
    });
  }
}
