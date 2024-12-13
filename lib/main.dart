import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:obsidian_like_note/core/color_palette.dart';
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
    scaffoldBackgroundColor: ColorPalette.pastelCream,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}
