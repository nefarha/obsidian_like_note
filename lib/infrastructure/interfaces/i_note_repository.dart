import 'package:fpdart/fpdart.dart';
import 'package:get/get.dart';
import 'package:obsidian_like_note/infrastructure/model/note/note_model.dart';

abstract interface class INoteRepository {
  static INoteRepository get isntance => Get.find();

  TaskEither<String, List<NoteModel>> getAllNotes({required String folderId});
  TaskEither<String, List<NoteModel>> getAllNotesWithoutId();
  TaskEither<String, Unit> createNote({required NoteModel model});
  TaskEither<String, Unit> deleteNote({required String id});
  TaskEither<String, Unit> editNote(
      {required String id, required NoteModel newModel});
}
