import 'package:flutter/material.dart';

class ChatModel {
  final String name;
  final bool isGroup;
  final String currentMessage;
  final String time;
  final IconData icon;

  ChatModel({
    required this.name,
    required this.isGroup,
    required this.currentMessage,
    required this.time,
    required this.icon,
  });
}
