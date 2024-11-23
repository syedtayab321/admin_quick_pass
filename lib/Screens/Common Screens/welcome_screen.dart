import 'package:admin_quick_pass/Custom%20Widgets/ElevatedButton.dart';
import 'package:admin_quick_pass/Custom%20Widgets/TextWidget.dart';
import 'package:admin_quick_pass/Screens/Auth%20Screens/login_screen.dart';
import 'package:admin_quick_pass/customColors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Container(
            color: AppColors.appColor,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.3),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomTextWidget(
                title: 'Quick Pass Documents',
                align: TextAlign.center,
                  color: Colors.white,
                  size: 32,
                  weight: FontWeight.bold,
              ),
              const SizedBox(height: 20),
              CustomTextWidget(
                title: 'Fast and Secure Document Management',
                align: TextAlign.center,
                  color: Colors.white.withOpacity(0.9),
                  size: 16,
              ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                  text: 'Login', color: Colors.white,
                  padding: 10,radius: 10,
                  width: 200,
                  height: 55,
                  backcolor:AppColors.secColor ,
                  path:(){
                    Get.to(const LoginScreen());
                  },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
