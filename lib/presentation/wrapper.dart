import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obsidian_like_note/presentation/mobile_design/mobile_home_page.dart';
import 'package:obsidian_like_note/presentation/web_design/web_home_page.dart';

class WidgetWrapper extends GetResponsiveView {
  WidgetWrapper({super.key});

  @override
  Widget? phone() {
    return const MobileHomePage();
  }

  @override
  Widget? desktop() {
    return const WebHomePage();
  }
}
