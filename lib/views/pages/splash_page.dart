import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_email_generator_app/colors.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(
        HomePage(),
      );
    });
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        // color: Color.fromARGB(255, 68, 33, 243),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.email,
              color: Colors.white,
              size: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Smart Email Generator",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
