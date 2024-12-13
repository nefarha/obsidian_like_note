import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:obsidian_like_note/infrastructure/model/folder/folder_model.dart';

abstract interface class IFolderRepository {
  static IFolderRepository get instance => Get.find();
  TaskEither<String, List<FolderModel>> getAllFolder();
  TaskEither<String, Unit> createFolder({required FolderModel model});
  TaskEither<String, Unit> deleteFolder({required String id});
}
