import 'package:fpdart/fpdart.dart';
import 'package:obsidian_like_note/infrastructure/model/folder/folder_model.dart';

abstract interface class IFolderRepository {
  TaskEither<String, List<FolderModel>> getAllFolder();
  TaskEither<String, Unit> createFolder({required FolderModel model});
}
