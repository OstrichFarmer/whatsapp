import 'package:flutter/material.dart';
import 'package:whatsapp/custom_ui/custom_card.dart';
import 'package:whatsapp/models/chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "john Doe",
        isGroup: false,
        currentMessage: "Hi John",
        time: "12:34PM",
        icon: Icons.person),
    ChatModel(
        name: "joh Doe",
        isGroup: false,
        currentMessage: "Are you there?",
        time: "7:34PM",
        icon: Icons.person),
    ChatModel(
        name: "jonah",
        isGroup: false,
        currentMessage: "What's up today",
        time: "12:34PM",
        icon: Icons.person),
    ChatModel(
        name: "jane Doe",
        isGroup: false,
        currentMessage: "Hello Jane",
        time: "12:34PM",
        icon: Icons.person),
    ChatModel(
        name: "Dev Community",
        isGroup: true,
        currentMessage: "Hi John",
        time: "11:04AM",
        icon: Icons.group),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          CustomCard(),
          CustomCard(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
    );
  }
}
