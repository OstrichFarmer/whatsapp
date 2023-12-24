import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/custom_ui/own_message_card.dart';
import 'package:whatsapp/custom_ui/reply_card.dart';
import 'package:whatsapp/models/chat_model.dart';
import 'package:socket_io_client/socket_io_client.dart';

class IndividualChatScreen extends StatefulWidget {
  const IndividualChatScreen({
    super.key,
    required this.chatModel,
  });
  final ChatModel chatModel;

  @override
  State<IndividualChatScreen> createState() => _IndividualChatScreenState();
}

class _IndividualChatScreenState extends State<IndividualChatScreen> {
  bool showEmoji = false;
  final _textEditingController = TextEditingController();
  Socket? socket;
  @override
  void initState() {
    connect();
    super.initState();
  }

  void connect() {
    socket = io(
        'http://192.168.0.190:3000',
        OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect() // disable auto-connection
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());

    socket!.connect();
    socket!.onConnect((_) {
      debugPrint(socket!.connected.toString());
      debugPrint('connect');
      socket!.emitWithAck('msg', 'init', ack: (data) {
        debugPrint('ack $data');
        if (data != null) {
          debugPrint('from server $data');
        } else {
          debugPrint("Null");
        }
      });
    });
  }

  @override
  void dispose() {
    socket!.disconnect();
    socket!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        GestureDetector(
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
              backgroundColor: Colors.transparent,
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
                        widget.chatModel.isGroup! ? Icons.group : Icons.person,
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
                          widget.chatModel.name!,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 145,
                      child: ListView(
                        children: const [
                          OwnMessageCard(),
                          ReplyCard(),
                          OwnMessageCard(),
                          ReplyCard(),
                          OwnMessageCard(),
                          ReplyCard(),
                          OwnMessageCard(),
                          ReplyCard(),
                          OwnMessageCard(),
                          ReplyCard(),
                          OwnMessageCard(),
                          ReplyCard(),
                        ],
                      ),
                    ),
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
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: TextFormField(
                                      onTap: () {
                                        setState(() {
                                          showEmoji = false;
                                        });
                                      },
                                      controller: _textEditingController,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 10,
                                      minLines: 1,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Type here ",
                                          contentPadding:
                                              const EdgeInsets.all(5),
                                          prefixIcon: IconButton(
                                            icon: Icon(showEmoji
                                                ? Icons.keyboard
                                                : Icons
                                                    .emoji_emotions_outlined),
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
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.35,
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
        ),
      ],
    );
  }

  Widget attachFileSheet() {
    return SizedBox(
      height: 270,
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget(
                    ontap: () {},
                    icon: Icons.insert_drive_file,
                    color: Colors.indigo,
                    title: "Documents"),
                iconWidget(
                    icon: Icons.camera_alt,
                    color: Colors.pink,
                    title: "Camera"),
                iconWidget(
                    icon: Icons.insert_photo,
                    color: Colors.purple,
                    title: "Gallery"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                iconWidget(
                    icon: Icons.headset, color: Colors.orange, title: "Audio"),
                iconWidget(
                    icon: Icons.location_pin,
                    color: Colors.green,
                    title: "Location"),
                iconWidget(
                    icon: Icons.person, color: Colors.blue, title: "Contacts"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget iconWidget(
      {required IconData icon,
      required Color color,
      required String title,
      Function()? ontap}) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 30,
            child: Icon(
              color: Colors.white,
              icon,
              size: 27,
            ),
          ),
          Text(title)
        ],
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
