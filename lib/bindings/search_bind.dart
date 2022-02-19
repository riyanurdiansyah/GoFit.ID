import 'package:futsal_app/controllers/auth_c.dart';
import 'package:futsal_app/controllers/search_c.dart';
import 'package:get/get.dart';

class SearchBind implements Bindings {
  @override
  void dependencies() {
    Get.put(SearchC());
  }
}
