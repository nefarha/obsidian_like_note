import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:obsidian_like_note/presentation/wrapper.dart';

void main() {
  runApp(const ObsidianLike());
}

class ObsidianLike extends StatelessWidget {
  const ObsidianLike({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WidgetWrapper(),
      theme: customThemeData(),
    );
  }
}

ThemeData customThemeData() {
  return ThemeData(
    useMaterial3: false,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}
