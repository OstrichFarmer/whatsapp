import 'package:flutter/material.dart';
import 'package:whatsapp/custom_ui/button_card.dart';
import 'package:whatsapp/custom_ui/contact_card.dart';
import 'package:whatsapp/models/chat_model.dart';

class SelectContactScreen extends StatefulWidget {
  const SelectContactScreen({super.key});

  @override
  State<SelectContactScreen> createState() => _SelectContactScreenState();
}

class _SelectContactScreenState extends State<SelectContactScreen> {
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
        name: "ShadowNet",
        status: "A full stack flutter developer",
      ),
      ChatModel(
        name: "Ostrich Farmer",
        status: "A full stack web developer",
      ),
      ChatModel(
        name: "John Doe",
        status: "A flutter mobile developer",
      ),
      ChatModel(
        name: "Jane Doe",
        status: "A cloud architect developer",
      ),
      ChatModel(
        name: "Joan",
        status: "A Devops engineer",
      ),
      ChatModel(
        name: "James",
        status: "A cloud architect developer",
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "234 Contacts",
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          PopupMenuButton<String>(
            color: Colors.white,
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(
                  value: "Invite a friend",
                  child: Text("Invite a friend"),
                ),
                PopupMenuItem(
                  value: "Contacts",
                  child: Text("Contacts"),
                ),
                PopupMenuItem(
                  value: "Refresh",
                  child: Text("Refresh"),
                ),
                PopupMenuItem(
                  value: "Help",
                  child: Text("Help"),
                ),
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: contacts.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const ButtonCard(title: "New group", icon: Icons.group);
            } else if (index == 1) {
              return const ButtonCard(
                  title: "New contact", icon: Icons.person_add);
            }
            return ContactCard(
              contacts: contacts[index - 2],
            );
          }),
    );
  }
}
