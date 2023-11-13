import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        radius: 25,
      ),
      trailing: Text("17:22pm"),
      title: Text(
        "John KPMG",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Row(
        children: [
          Icon(Icons.done_all),
          SizedBox(
            width: 5,
          ),
          Text("Hello joel"),
        ],
      ),
    );
  }
}
