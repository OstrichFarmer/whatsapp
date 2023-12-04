import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.ontap});
  final String title;
  final IconData icon;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: Color(0XFF25D366),
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
