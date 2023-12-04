import 'package:flutter/material.dart';

class ContactAvatar extends StatelessWidget {
  const ContactAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
        const Positioned(
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
      ],
    );
  }
}
