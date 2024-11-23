import 'package:admin_quick_pass/Custom%20Widgets/TextWidget.dart';
import 'package:admin_quick_pass/customColors/app_color.dart';
import 'package:flutter/material.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({super.key});

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  final List<Map<String, String>> messages = [
    {
      "sender": "John Doe",
      "message": "Hey, are you available tomorrow?",
      "time": "2 mins ago",
      "isMe": "true",
    },
    {
      "sender": "Jane Smith",
      "message": "Let's discuss the project details.",
      "time": "5 mins ago",
      "isMe": "false",
    },
    {
      "sender": "John Doe",
      "message": "Sure, let me check my schedule.",
      "time": "10 mins ago",
      "isMe": "true",
    },
    {
      "sender": "Jane Smith",
      "message": "Great, looking forward to it.",
      "time": "15 mins ago",
      "isMe": "false",
    },
  ];

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        title: const CustomTextWidget(title: "Conversation"),
        backgroundColor: AppColors.appColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return _buildMessageCard(messages[index]);
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageCard(Map<String, String> message) {
    bool isMe = message['isMe'] == 'true';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
            color: isMe ? AppColors.secColor : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
               title:  message['sender'] ?? '',
                weight: FontWeight.bold,
                size: 16,
                  color: isMe ? Colors.white : Colors.black,
              ),
              const SizedBox(height: 5),
              CustomTextWidget(
                title:message['message'] ?? '',
                size: 16,
                  color: isMe ? Colors.white : Colors.black,
                ),
              const SizedBox(height: 5),
              CustomTextWidget(
                title:message['time'] ?? '',
                size: 12,
                color: isMe ? Colors.white70 : Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Type a message...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.send, color: AppColors.secColor),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
