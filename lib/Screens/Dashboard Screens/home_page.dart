import 'package:admin_quick_pass/Custom%20Widgets/Drawer.dart';
import 'package:admin_quick_pass/Custom%20Widgets/TextWidget.dart';
import 'package:admin_quick_pass/Screens/Messages/message_screen.dart';
import 'package:admin_quick_pass/Screens/Orders%20Related/view_orders.dart';
import 'package:admin_quick_pass/Screens/Users%20Related/user_details.dart';
import 'package:admin_quick_pass/customColors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        title: const CustomTextWidget(title: "Quick Pass Admin Dashboard"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout)),
        ],
        backgroundColor: AppColors.appColor,
        foregroundColor: Colors.white,
      ),
      drawer: const CustomDrawer(),
      body: _buildDashboardBody(context),
    );
  }

  Widget _buildDashboardBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Beautiful Overview Text
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: const CustomTextWidget(
              title: "Welcome to the Quick Pass Admin Dashboard",
              size: 26,
              weight: FontWeight.bold,
              color: Colors.white,
              align: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          GridView.count(
            crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildActionCard(
                icon: Icons.people,
                title: "View Users",
                color: Colors.blueAccent,
                onTap: () {
                 Get.to(const UsersPage());
                },
              ),
              _buildActionCard(
                icon: Icons.shopping_cart,
                title: "View Orders",
                color: Colors.green,
                onTap: () {
                  Get.to(const UserOrdersPage());
                },
              ),
              _buildActionCard(
                icon: Icons.message,
                title: "View Messages",
                color: Colors.orange,
                onTap: () {
                  Get.to(const MessagesPage());
                },
              ),
              _buildActionCard(
                icon: Icons.notifications,
                title: "View Notifications",
                color: Colors.redAccent,
                onTap: () {
                  // Add action for View Notifications
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 4,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: color),
                const SizedBox(height: 10),
                CustomTextWidget(
                  title: title,
                  size: 16,
                  weight: FontWeight.bold,
                  align: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
