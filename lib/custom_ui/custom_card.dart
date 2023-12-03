import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:whatsapp/screens/individual_chat_screen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.chatModel});
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IndividualChatScreen(
              chatModel: chatModel,
            ),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey,
              child: Icon(
                chatModel.isGroup! ? Icons.group : Icons.person,
                color: Colors.white,
                size: 35,
              ),
            ),
            trailing: Text(chatModel.time!),
            title: Text(
              chatModel.name!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all),
                const SizedBox(
                  width: 5,
                ),
                Text(chatModel.currentMessage!),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 80,
              right: 20,
            ),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
