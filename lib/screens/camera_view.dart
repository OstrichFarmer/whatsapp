import 'dart:io';

import 'package:flutter/material.dart';

class CameraViewScreen extends StatelessWidget {
  const CameraViewScreen({super.key, required this.path});
  final String path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.crop_rotate),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.emoji_emotions_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.title),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            child: Image.file(
              File(path),
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: Colors.black38,
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                maxLines: 6,
                minLines: 1,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.add_photo_alternate,
                    color: Colors.white,
                  ),
                  suffixIcon: CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 26,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 27,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: "Add caption ....",
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
