import 'package:flutter/material.dart';

class ChatModel {
  final String? name;
  final bool? isGroup;
  final String? currentMessage;
  final String? time;
  final IconData? icon;
  final String? status;
  bool selected = false; // Not nullable

  ChatModel({
    this.name,
    this.isGroup,
    this.currentMessage,
    this.time,
    this.icon,
    this.status,
    this.selected = false, // Set a default value
  });
}
