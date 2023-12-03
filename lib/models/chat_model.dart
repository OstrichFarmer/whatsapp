import 'package:flutter/material.dart';

class ChatModel {
  final String? name;
  final bool? isGroup;
  final String? currentMessage;
  final String? time;
  final IconData? icon;
  final String? status;

  ChatModel({
    this.name,
    this.isGroup,
    this.currentMessage,
    this.time,
    this.icon,
    this.status,
  });
}
