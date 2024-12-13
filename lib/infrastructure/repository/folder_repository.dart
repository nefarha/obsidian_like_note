import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:obsidian_like_note/infrastructure/interfaces/i_folder_repository.dart';
import 'package:obsidian_like_note/infrastructure/model/folder/folder_model.dart';

class FolderRepository implements IFolderRepository {
  final _folderBox = Hive.box<FolderModel>('folder');

  @override
  TaskEither<String, List<FolderModel>> getAllFolder() {
    return TaskEither.tryCatch(
      () async {
        final folders = _folderBox.values.toList();
        return folders;
      },
      (error, stackTrace) => error.toString(),
    );
  }

  @override
  TaskEither<String, Unit> createFolder({required FolderModel model}) {
    return TaskEither.tryCatch(
      () async {
        _folderBox.add(model);
        return unit;
      },
      (error, stackTrace) => error.toString(),
    );
  }

  @override
  TaskEither<String, Unit> deleteFolder({required String id}) {
    return TaskEither.tryCatch(
      () async {
        var folderKey = _folderBox.keys.firstWhere(
            (element) => _folderBox.get(element)?.id == id,
            orElse: () => null);

        _folderBox.delete(folderKey);
        return unit;
      },
      (error, stackTrace) => error.toString(),
    );
  }
}
