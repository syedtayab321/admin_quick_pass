import 'package:admin_quick_pass/Custom%20Widgets/TextWidget.dart';
import 'package:admin_quick_pass/Screens/Messages/conversation_screen.dart';
import 'package:admin_quick_pass/customColors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        title: const CustomTextWidget(title: "Messages"),
        backgroundColor: AppColors.appColor,
        foregroundColor: Colors.white,
      ),
      body: _buildMessagesList(context),
    );
  }

  Widget _buildMessagesList(BuildContext context) {
    final List<Map<String, String>> messages = [
      {
        "username": "John Doe",
        "message": "Hey, are you available tomorrow?",
        "time": "2 mins ago",
        "image": "https://randomuser.me/api/portraits/men/1.jpg",
      },
      {
        "username": "Jane Smith",
        "message": "Let's discuss the project details.",
        "time": "5 mins ago",
        "image": "https://randomuser.me/api/portraits/women/1.jpg",
      },
      {
        "username": "Alice Johnson",
        "message": "Can you send me the report by today?",
        "time": "10 mins ago",
        "image": "https://randomuser.me/api/portraits/women/2.jpg",
      },
      {
        "username": "Bob Brown",
        "message": "Reminder: Meeting at 3 PM.",
        "time": "15 mins ago",
        "image": "https://randomuser.me/api/portraits/men/2.jpg",
      },
    ];

    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return _buildMessageCard(messages[index], context);
      },
    );
  }

  Widget _buildMessageCard(Map<String, String> message, BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(message['image'] ?? ''),
              radius: 30,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                   title:  message['username'] ?? "Unknown User",
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(height: 4),
                  CustomTextWidget(
                    title:message['message'] ?? "No recent message",
                    size: 16,
                    color: Colors.black54,
                    flow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  CustomTextWidget(
                    title:message['time'] ?? "N/A",
                    size: 14,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.chat_bubble_outline,
                color: Colors.blueAccent,
              ),
              onPressed: () {
                Get.to(const ConversationPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
