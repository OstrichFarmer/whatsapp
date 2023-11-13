import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          "Whatsapp",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: Colors.white,
          ),
          PopupMenuButton<String>(itemBuilder: (BuildContext context) {
            return [
              PopupMenuItem(
                child: Text("New group"),
                value: "New group",
              ),
              PopupMenuItem(
                child: Text("New broadcast"),
                value: "New broadcast",
              ),
              PopupMenuItem(
                child: Text("Whatsapp web"),
                value: "Whatsapp web",
              ),
              PopupMenuItem(
                child: Text("Starred message"),
                value: "Starred message",
              ),
              PopupMenuItem(
                child: Text("Settings "),
                value: "Settings",
              ),
            ];
          })
        ],
        bottom: TabBar(controller: _controller, tabs: const [
          Tab(
            icon: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
          ),
          Tab(
            child: Text(
              "Chats",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Tab(
            child: Text(
              "Status",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Tab(
            child: Text(
              "Calls",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          Text("CAMERA"),
          Text("CHATS"),
          Text("STATUS"),
          Text("CALLS"),
        ],
      ),
    );
  }
}
