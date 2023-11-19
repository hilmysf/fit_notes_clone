import 'package:flutter/material.dart';

class MusclesGroup {
  String title;
  String color;

  MusclesGroup({required this.title, required this.color});

  Map<String, dynamic> toJson() => {
        'title': title,
        'color': color,
      };

  factory MusclesGroup.fromJson(Map<dynamic, dynamic> parsedJson) {
    return MusclesGroup(title: parsedJson['title'], color: parsedJson['color']);
  }
}
