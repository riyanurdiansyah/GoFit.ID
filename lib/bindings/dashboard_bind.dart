import 'package:futsal_app/controllers/dashboard_c.dart';
import 'package:get/get.dart';

class DashboardBind extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardC());
  }
}
