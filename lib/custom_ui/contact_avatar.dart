import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';

class ContactAvatar extends StatelessWidget {
  const ContactAvatar({super.key, required this.contacts});

  final ChatModel contacts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.shade400,
                child: const Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const Positioned(
                bottom: -2,
                right: -2,
                child: CircleAvatar(
                  radius: 11,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 60,
            child: Text(
              contacts.name!,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
