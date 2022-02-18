import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:futsal_app/routes/routes.dart';
import 'package:futsal_app/routes/routes_name.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      title: "GoFit.ID",
      getPages: AppRoutes.route,
      initialRoute: AppRoutesName.splash,
    );
  }
}
