import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';

class IndividualChatScreen extends StatefulWidget {
  const IndividualChatScreen({super.key, required this.chatModel});
  final ChatModel chatModel;
  @override
  State<IndividualChatScreen> createState() => _IndividualChatScreenState();
}

class _IndividualChatScreenState extends State<IndividualChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leadingWidth: 80,
        titleSpacing: 0,
        leading: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 20,
              child: Icon(
                widget.chatModel.isGroup ? Icons.group : Icons.person,
                color: Colors.white,
                size: 35,
              ),
            )
          ],
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatModel.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  "Last seen today at 12:22pm",
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.videocam,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call,
              color: Colors.white,
            ),
          ),
          PopupMenuButton<String>(
            color: Colors.white,
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(
                  value: "View contact",
                  child: Text("View contact"),
                ),
                PopupMenuItem(
                  value: "Media, links and doc",
                  child: Text("Media, links and doc"),
                ),
                PopupMenuItem(
                  value: "Whatsapp web",
                  child: Text("Whatsapp web"),
                ),
                PopupMenuItem(
                  value: "Search",
                  child: Text("Search"),
                ),
                PopupMenuItem(
                  value: "Mute notifications",
                  child: Text("Mute notifications "),
                ),
                PopupMenuItem(
                  value: "Wallpaper",
                  child: Text("Wallpaper "),
                ),
              ];
            },
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                      margin:
                          const EdgeInsets.only(left: 3, right: 3, bottom: 8),
                      width: MediaQuery.of(context).size.width - 55,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.multiline,
                          maxLines: 10,
                          minLines: 1,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type here ",
                              contentPadding: const EdgeInsets.all(5),
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.emoji_emotions_outlined),
                                onPressed: () {},
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.attach_file)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.camera_alt)),
                                ],
                              )),
                        ),
                      )),
                  const CircleAvatar(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
