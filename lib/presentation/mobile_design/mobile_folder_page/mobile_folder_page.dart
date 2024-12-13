import 'package:flutter/material.dart';
import 'package:obsidian_like_note/core/color_palette.dart';
import 'package:obsidian_like_note/core/common_utils.dart';
import 'package:fpdart/fpdart.dart' as fp;
import 'package:obsidian_like_note/infrastructure/interfaces/i_note_repository.dart';
import 'package:obsidian_like_note/infrastructure/model/note/note_model.dart';
import 'package:obsidian_like_note/presentation/mobile_design/mobile_note_page/mobile_note_page.dart';
import 'package:uuid/uuid.dart';

class MobileFolderPage extends StatefulWidget {
  const MobileFolderPage({super.key, required this.id, required this.title});

  final String title;
  final String id;

  @override
  State<MobileFolderPage> createState() => _MobileFolderPageState();
}

class _MobileFolderPageState extends State<MobileFolderPage> {
  final _noteRepository = INoteRepository.isntance;
  final uid = const Uuid();

  var optionOrNotes =
      const fp.Option<fp.Either<String, List<NoteModel>>>.none();

  var noteNameController = TextEditingController();

  deleteNote({required String id}) async {
    var result = await _noteRepository.deleteNote(id: id).run();
    debugPrint('assda $result');
    result.match(
      (l) => null,
      (r) {
        getAllNotes();
      },
    );
  }

  editNoteDialog(
      {required BuildContext context, required NoteModel folderModel}) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Edit Note',
                style: CommonUtils.titleStyle,
              ),
              TextField(
                maxLines: 1,
                controller: noteNameController,
                cursorColor: ColorPalette.pastelGreen,
                decoration: const InputDecoration(
                  hintText: 'enter note name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  var newModel = folderModel.copyWith(
                    name: noteNameController.text,
                  );
                  var result = await _noteRepository
                      .editNote(id: folderModel.id, newModel: newModel)
                      .run();
                  result.match(
                    (l) => null,
                    (r) {
                      noteNameController.clear();
                      Navigator.of(context).pop();
                      getAllNotes();
                    },
                  );
                },
                child: const Text('edit'),
              )
            ],
          ),
        ),
      ),
    );
  }

  getAllNotes() async {
    var result = await _noteRepository.getAllNotes(folderId: widget.id).run();
    setState(() {
      optionOrNotes = fp.Option.of(result);
    });
  }

  createNoteDialog() async {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Create Note',
                style: CommonUtils.titleStyle,
              ),
              TextField(
                maxLines: 1,
                controller: noteNameController,
                cursorColor: ColorPalette.pastelGreen,
                decoration: const InputDecoration(
                  hintText: 'enter note name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  await createNote(contextDialog: context);
                },
                child: const Text('create'),
              )
            ],
          ),
        ),
      ),
    );
  }

  createNote({required BuildContext contextDialog}) async {
    if (noteNameController.text.isNotEmpty) {
      final model = NoteModel(
        id: uid.v1(),
        name: noteNameController.text,
        createdAt: DateTime.now(),
        folderId: widget.id,
        text: '',
      );

      var result = await _noteRepository.createNote(model: model).run();
      result.match(
        (l) => null,
        (r) {
          noteNameController.clear();
          Navigator.pop(contextDialog);
          getAllNotes();
        },
      );
    }
  }

  @override
  void initState() {
    getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.pastelCream,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          widget.title,
          style: CommonUtils.headerStyle.copyWith(color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      widget.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CommonUtils.headerStyle,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      createNoteDialog();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorPalette.pastelGreen,
                        boxShadow: [
                          BoxShadow(
                            color: ColorPalette.pastelGreen.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 0,
                            offset: const Offset(3, 5),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 15,
                        color: ColorPalette.pastelCream,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              optionOrNotes.match(
                () => const Center(
                  child: CircularProgressIndicator(),
                ),
                (t) => t.match(
                  (l) => Center(
                    child: Text(l),
                  ),
                  (r) => r.isEmpty
                      ? Center(
                          child: Text(
                            'No notes found',
                            style: CommonUtils.titleStyle,
                          ),
                        )
                      : Flexible(
                          child: ListView.separated(
                            itemBuilder: (context, index) =>
                                noteListCard(model: r[index]),
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: r.length,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget noteListCard({required NoteModel model}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MobileNotePage(
              model: model,
            ),
          ),
        ).then(
          (value) {
            getAllNotes();
          },
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  const Icon(
                    Icons.notes,
                    color: ColorPalette.pastelBrown,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: Text(
                      model.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CommonUtils.titleStyle,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                final newModel = model.copyWith(name: noteNameController.text);
                editNoteDialog(context: context, folderModel: newModel);
              },
              child: const Icon(
                Icons.edit,
                color: ColorPalette.pastelBrown,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                deleteNote(id: model.id);
              },
              child: const Icon(
                Icons.delete,
                color: ColorPalette.pastelBrown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
