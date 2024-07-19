import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:smart_email_generator_app/views/pages/home_page.dart';
import 'package:smart_email_generator_app/views/pages/splash_page.dart';
import 'package:toastification/toastification.dart';

void main() {
  runApp(
    ToastificationWrapper(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    ),
  );
}
