import 'package:flutter/material.dart';
import 'package:whatsapp/custom_ui/custom_card.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/screens/select_contact_screen.dart';

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
        name: "joh Doe and Friends",
        isGroup: true,
        currentMessage: "Are you there guys?",
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
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(
          chatModel: chats[index],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => const SelectContactScreen()));
        },
        child: const Icon(Icons.chat),
      ),
    );
  }
}
