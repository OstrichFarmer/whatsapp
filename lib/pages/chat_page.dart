import 'package:flutter/material.dart';
import 'package:whatsapp/custom_ui/custom_card.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
