import 'package:admin_quick_pass/Custom%20Widgets/TextWidget.dart';
import 'package:admin_quick_pass/customColors/app_color.dart';
import 'package:flutter/material.dart';

import '../../Custom Widgets/ElevatedButton.dart';

class UserOrdersPage extends StatelessWidget {
  const UserOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        title: const CustomTextWidget(
          title: "Manage Orders",
          color: Colors.white,
        ),
        backgroundColor: AppColors.appColor,
      ),
      body: _buildOrdersBody(context),
    );
  }

  Widget _buildOrdersBody(BuildContext context) {
    final List<Map<String, String>> orders = [
      {
        "user": "John Doe",
        "travelTo": "New York",
        "travelFrom": "Los Angeles",
        "status": "Pending",
      },
      {
        "user": "Jane Smith",
        "travelTo": "London",
        "travelFrom": "Paris",
        "status": "Approved",
      },
      {
        "user": "Alice Johnson",
        "travelTo": "Sydney",
        "travelFrom": "Melbourne",
        "status": "Rejected",
      },
      {
        "user": "Bob Brown",
        "travelTo": "Dubai",
        "travelFrom": "Abu Dhabi",
        "status": "Pending",
      },
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: orders.map((order) {
            return _buildOrderCard(order, context);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildOrderCard(Map<String, String> order, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              title:order['user'] ?? "Unknown User",
              size: 20,
                weight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            _buildOrderDetailRow("Travel To", order['travelTo'], true),
            const SizedBox(height: 8),
            _buildOrderDetailRow("Travel From", order['travelFrom'], true),
            const SizedBox(height: 8),
            _buildOrderDetailRow("Status", order['status'], false, isStatus: true),
            const SizedBox(height: 16),
            // Buttons for actions
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                      text: 'View Details', color: Colors.white,
                      padding: 10,radius: 10,
                      width: 150,
                      height: 55,
                      backcolor:AppColors.secColor,
                      path:(){},
                    ),
                    CustomElevatedButton(
                      text: 'Approved', color: Colors.white,
                      padding: 10,radius: 10,
                      width: 150,
                      height: 55,
                      backcolor:Colors.green,
                      path:(){},
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomElevatedButton(
                      text: 'Reject', color: Colors.white,
                      padding: 10,radius: 10,
                      width: 150,
                      height: 55,
                      backcolor:Colors.red,
                      path:(){},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderDetailRow(
      String label, String? value, bool highlight, {bool isStatus = false}) {
    Color statusColor;
    switch (value) {
      case "Pending":
        statusColor = Colors.orange;
        break;
      case "Approved":
        statusColor = Colors.green;
        break;
      case "Rejected":
        statusColor = Colors.redAccent;
        break;
      default:
        statusColor = Colors.black;
    }

    return Row(
      children: [
        CustomTextWidget(
          title: "$label: ",
          weight: FontWeight.bold,
          size: 16,
        ),
        Flexible(
          child: CustomTextWidget(
           title:  value ?? "N/A",
            size: 16,
            color: isStatus ? statusColor : Colors.black,
            weight: highlight ? FontWeight.w500 : FontWeight.normal,
            flow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
