import 'package:flutter/material.dart';
import 'package:flutter_random_color/view/color_page.dart';

/// Root widget of the random color application
class ColorsApp extends MaterialApp {
  /// Creates the application widget
  const ColorsApp({super.key}) : super(home: const ColorPage());
}
