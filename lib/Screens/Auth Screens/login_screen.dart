import 'package:admin_quick_pass/customColors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Custom Widgets/TextWidget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextWidget(
              title: "Login here",
              size: 28,
              weight: FontWeight.bold,
              color: Colors.white,
            ),
            const SizedBox(height: 8),
            const CustomTextWidget(
              title: "Welcome back you’ve been missed!",
              size: 16,
              color: Colors.white,
            ),
            const SizedBox(height: 32),
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:  const BorderSide(color: Colors.white, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:  const BorderSide(color: Colors.white, width: 1.5),
                ),
                filled: true,
                fillColor:Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                labelStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white, width: 1.5),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerRight,
              child: CustomTextWidget(
                title: "Forgot your password?",
               color: Colors.white,
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                ),
                child: const CustomTextWidget(
                  title: "Sign in",
                  size: 18, color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
