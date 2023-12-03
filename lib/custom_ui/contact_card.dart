import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        "Ostrich Farmer",
        style: TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: const Text("A flutter mobile developer"),
      leading: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.grey.shade400,
        child: const Icon(
          Icons.person,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
