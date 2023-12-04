import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contacts, this.ontap});
  final ChatModel contacts;
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        title: Text(
          contacts.name!,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(contacts.status!),
        leading: Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.grey.shade400,
              child: const Icon(
                Icons.person,
                size: 30,
                color: Colors.white,
              ),
            ),
            contacts.selected
                ? const Positioned(
                    bottom: -3,
                    right: -4,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.teal,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
