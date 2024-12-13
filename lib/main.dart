import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:obsidian_like_note/core/color_palette.dart';
import 'package:obsidian_like_note/infrastructure/interfaces/i_folder_repository.dart';
import 'package:obsidian_like_note/infrastructure/model/folder/folder_model.dart';
import 'package:obsidian_like_note/infrastructure/repository/folder_repository.dart';
import 'package:obsidian_like_note/presentation/wrapper.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = await getExternalStorageDirectory();
  Hive.init(path?.path);

  Hive.registerAdapter<FolderModel>(FolderAdapter());

  await Hive.openBox<FolderModel>('folder');
  runApp(const ObsidianLike());
}

class ObsidianLike extends StatelessWidget {
  const ObsidianLike({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<IFolderRepository>(FolderRepository());
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
