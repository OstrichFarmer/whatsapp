import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({super.key, required this.contacts});
  final ChatModel contacts;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        title: Text(
          contacts.name!,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(contacts.status!),
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: Colors.grey.shade400,
          child: const Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
