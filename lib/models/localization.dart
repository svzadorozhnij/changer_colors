import 'package:flutter/material.dart';

@immutable
class Localization {
  final String appName;
  final String heyThere;

  const Localization({required this.appName, required this.heyThere});

  factory Localization.fromJson(Map<String, dynamic> data) => Localization(
        appName: data['appName'].toString(),
        heyThere: data['heyThere'].toString(),
      );
}
