import 'package:admin_quick_pass/Screens/Auth%20Screens/login_screen.dart';
import 'package:admin_quick_pass/Screens/Common%20Screens/welcome_screen.dart';
import 'package:admin_quick_pass/Screens/Dashboard%20Screens/home_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context)=>const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Admin Quick Pass',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AdminHomePage(),
      // home: const WelcomeScreen(),
    );
  }
}
