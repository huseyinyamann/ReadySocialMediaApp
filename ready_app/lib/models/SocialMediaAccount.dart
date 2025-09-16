// ignore_for_file: file_names

import 'package:flutter/material.dart';

/// Sosyal medya hesapları için model sınıfı
class SocialMediaAccount {
  final String name;
  final Color color;
  final IconData icon;
  final String url;

  SocialMediaAccount({
    required this.name,
    required this.color,
    required this.icon,
    required this.url,
  });
}