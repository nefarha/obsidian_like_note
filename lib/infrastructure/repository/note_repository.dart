import 'package:fpdart/fpdart.dart';
import 'package:hive/hive.dart';
import 'package:obsidian_like_note/infrastructure/interfaces/i_note_repository.dart';
import 'package:obsidian_like_note/infrastructure/model/note/note_model.dart';

class NoteRepository implements INoteRepository {
  final _noteBox = Hive.box<NoteModel>('notes');

  @override
  TaskEither<String, List<NoteModel>> getAllNotes({required String folderId}) {
    return TaskEither.tryCatch(
      () async {
        var result = _noteBox.values
            .where((element) => element.folderId == folderId)
            .toList();

        return result;
      },
      (error, stackTrace) => error.toString(),
    );
  }

  @override
  TaskEither<String, List<NoteModel>> getAllNotesWithoutId() {
    return TaskEither.tryCatch(
      () async {
        return _noteBox.values.toList();
      },
      (error, stackTrace) => error.toString(),
    );
  }

  @override
  TaskEither<String, Unit> createNote({required NoteModel model}) {
    return TaskEither.tryCatch(
      () async {
        _noteBox.add(model);
        return unit;
      },
      (error, stackTrace) => error.toString(),
    );
  }

  @override
  TaskEither<String, Unit> deleteNote({required String id}) {
    return TaskEither.tryCatch(
      () async {
        var noteKey = _noteBox.keys.firstWhere(
            (element) => _noteBox.get(element)?.id == id,
            orElse: () => null);

        if (noteKey != null) {
          _noteBox.delete(noteKey);
        }

        return unit;
      },
      (error, stackTrace) => error.toString(),
    );
  }

  @override
  TaskEither<String, Unit> editNote(
      {required String id, required NoteModel newModel}) {
    return TaskEither.tryCatch(
      () async {
        var noteKey = _noteBox.keys.firstWhere(
            (element) => _noteBox.get(element)?.id == id,
            orElse: () => null);

        if (noteKey != null) {
          _noteBox.put(noteKey, newModel);
        }

        return unit;
      },
      (error, stackTrace) => error.toString(),
    );
  }
}
