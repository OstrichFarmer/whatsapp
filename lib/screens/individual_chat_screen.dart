import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/models/chat_model.dart';

class IndividualChatScreen extends StatefulWidget {
  const IndividualChatScreen({super.key, required this.chatModel});
  final ChatModel chatModel;
  @override
  State<IndividualChatScreen> createState() => _IndividualChatScreenState();
}

bool showEmoji = false;
final _textEditingController = TextEditingController();

class _IndividualChatScreenState extends State<IndividualChatScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () {
          if (showEmoji) {
            setState(() => showEmoji = !showEmoji);

            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },
        child: Scaffold(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(
                                  left: 3, right: 3, bottom: 8),
                              width: MediaQuery.of(context).size.width - 55,
                              child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                child: TextFormField(
                                  onTap: () {
                                    setState(() {
                                      showEmoji = false;
                                    });
                                  },
                                  controller: _textEditingController,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  maxLines: 10,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Type here ",
                                      contentPadding: const EdgeInsets.all(5),
                                      prefixIcon: IconButton(
                                        icon: Icon(showEmoji
                                            ? Icons.keyboard
                                            : Icons.emoji_emotions_outlined),
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();
                                          setState(() {
                                            showEmoji = !showEmoji;
                                          });
                                        },
                                      ),
                                      suffixIcon: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                barrierColor:
                                                    Colors.transparent,
                                                backgroundColor:
                                                    Colors.transparent,
                                                context: context,
                                                builder: (builder) =>
                                                    attachFileSheet(),
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.attach_file,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.camera_alt,
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.mic),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      showEmoji
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height * 0.35,
                              child: emojiSelect(),
                            )
                          : const SizedBox()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget attachFileSheet() {
    return Container(
      height: 300,
      width: double.infinity,
      child: const Card(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      textEditingController: _textEditingController,
      config: Config(
        columns: 7,
        emojiSizeMax: 32 * (Platform.isIOS ? 1.3 : 1.0),
      ),
    );
  }
}
