import 'package:admin_quick_pass/Custom%20Widgets/TextWidget.dart';
import 'package:admin_quick_pass/customColors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Custom Widgets/ElevatedButton.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        title: const CustomTextWidget(title: "Manage Users"),
        backgroundColor: AppColors.appColor,
        foregroundColor: Colors.white,
      ),
      body: _buildUsersBody(context),
    );
  }

  Widget _buildUsersBody(BuildContext context) {
    final List<Map<String, String>> users = [
      {
        "name": "John Doe",
        "email": "john.doe@example.com",
        "phone": "123-456-7890",
        "address": "123 Main St, Springfield",
      },
      {
        "name": "Jane Smith",
        "email": "jane.smith@example.com",
        "phone": "987-654-3210",
        "address": "456 Oak St, Springfield",
      },
      {
        "name": "Alice Johnson",
        "email": "alice.johnson@example.com",
        "phone": "555-444-3333",
        "address": "789 Pine St, Springfield",
      },
      {
        "name": "Bob Brown",
        "email": "bob.brown@example.com",
        "phone": "111-222-3333",
        "address": "101 Maple St, Springfield",
      },
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: users.map((user) {
            return _buildUserCard(user, context);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildUserCard(Map<String, String> user, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextWidget(
                  title: user['name'] ?? "Unknown",
                  size: 22,
                  weight: FontWeight.bold,
                ),
                IconButton(onPressed: (){}, icon: const Icon(Icons.delete),color: Colors.red,)
              ],
            ),
            const SizedBox(height: 8),
            _buildUserInfoRow("Email", user['email']),
            const SizedBox(height: 8),
            _buildUserInfoRow("Phone", user['phone']),
            const SizedBox(height: 8),
            _buildUserInfoRow("Address", user['address']),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomElevatedButton(
                  text: 'View Docs', color: Colors.white,
                  padding: 10,radius: 10,
                  width: 150,
                  height: 55,
                  backcolor:Colors.green,
                  path:(){},
                ),
                  CustomElevatedButton(
                    text: 'View Orders', color: Colors.white,
                    padding: 10,radius: 10,
                    width: 150,
                    height: 55,
                    backcolor:AppColors.secColor ,
                    path:(){
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoRow(String label, String? value) {
    return Row(
      children: [
        CustomTextWidget(
         title:  "$label: ",
          weight: FontWeight.bold,
          size: 16,
        ),
        Flexible(
          child: CustomTextWidget(
           title:  value ?? "N/A",
            size: 16,
            flow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
