import 'package:flutter/material.dart';
import 'package:whatsapp/custom_ui/contact_avatar.dart';
import 'package:whatsapp/custom_ui/contact_card.dart';
import 'package:whatsapp/models/chat_model.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
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

  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New group",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              "Add participants",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: contacts.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return SizedBox(
                    height: groups.isNotEmpty ? 90 : 5,
                  );
                }
                return ContactCard(
                  ontap: () {
                    if (contacts[index - 1].selected == false) {
                      setState(() {
                        contacts[index - 1].selected = true;
                        groups.add(contacts[index - 1]);
                      });
                    } else {
                      setState(() {
                        contacts[index - 1].selected = false;
                        groups.remove(contacts[index - 1]);
                      });
                    }
                  },
                  contacts: contacts[index - 1],
                );
              }),
          groups.isNotEmpty
              ? Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 75,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            if (contacts[index].selected == true) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    contacts[index].selected = false;
                                    groups.remove(contacts[index]);
                                  });
                                },
                                child: ContactAvatar(
                                  contacts: contacts[index],
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          }),
                    ),
                    const Divider(
                      thickness: 1,
                    )
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
