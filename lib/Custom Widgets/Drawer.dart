import 'package:admin_quick_pass/Custom%20Widgets/TextWidget.dart';
import 'package:admin_quick_pass/customColors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.appColor,
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: CustomTextWidget(
                title: "Admin Panel",
                color: Colors.white, size: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard,color: Colors.white),
            title: const CustomTextWidget(title: "Home",color: Colors.white,),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.folder,color: Colors.white),
            title: const CustomTextWidget(title: "Manage Users",color: Colors.white),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.people,color: Colors.white),
            title: const CustomTextWidget(title: "User Management",color: Colors.white),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.analytics,color: Colors.white),
            title: const CustomTextWidget(title: "Reports",color: Colors.white),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout,color: Colors.red,),
            title: const CustomTextWidget(title: "Logout",color: Colors.white),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
