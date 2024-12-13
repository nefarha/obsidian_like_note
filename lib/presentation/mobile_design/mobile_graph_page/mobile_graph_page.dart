import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'dart:collection';
import 'package:graphview/GraphView.dart';
import 'package:obsidian_like_note/core/color_palette.dart';
import 'package:obsidian_like_note/core/common_utils.dart';
import 'package:obsidian_like_note/infrastructure/interfaces/i_folder_repository.dart';
import 'package:obsidian_like_note/infrastructure/interfaces/i_note_repository.dart';
import 'package:obsidian_like_note/infrastructure/model/folder/folder_model.dart';
import 'package:obsidian_like_note/infrastructure/model/note/note_model.dart';
import 'package:obsidian_like_note/presentation/mobile_design/mobile_folder_page/mobile_folder_page.dart';
import 'package:obsidian_like_note/presentation/mobile_design/mobile_note_page/mobile_note_page.dart';

class MobileGraphPage extends StatefulWidget {
  const MobileGraphPage({super.key});

  @override
  State<MobileGraphPage> createState() => _MobileGraphPageState();
}

class _MobileGraphPageState extends State<MobileGraphPage> {
  final _folderRepository = IFolderRepository.instance;
  final _noteRepository = INoteRepository.isntance;

  final List<FolderModel> folders = [];
  final List<NoteModel> notes = [];

  final graph = Graph()..isTree = true;

  SugiyamaConfiguration graphBuilder = SugiyamaConfiguration();

  initData() async {
    folders.clear();
    notes.clear();
    var folderResult = await _folderRepository.getAllFolder().run();
    var noteResult = await _noteRepository.getAllNotesWithoutId().run();

    folderResult.match(
      (l) => null,
      (r) => setState(() {
        folders.addAll(r);
      }),
    );
    noteResult.match(
      (l) => null,
      (r) => setState(() {
        notes.addAll(r);
      }),
    );

    creatingNode();
  }

  creatingNode() {
    for (var folder in folders) {
      var folderNode = Node.Id(folder.id);

      for (var note in notes) {
        if (note.folderId != folder.id) continue;
        var noteNode = Node.Id(note.id);
        setState(() {
          graph.addEdge(folderNode, noteNode);
        });
      }
    }

    graphBuilder
      ..levelSeparation = (50)
      ..orientation = (SugiyamaConfiguration.ORIENTATION_LEFT_RIGHT);
  }

  @override
  void initState() {
    initData();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // final
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
          "Graph View",
          style: CommonUtils.headerStyle.copyWith(color: Colors.black),
        ),
      ),
      body: InteractiveViewer(
        constrained: false,
        boundaryMargin: const EdgeInsets.all(100),
        minScale: 0.01,
        maxScale: 5.6,
        child: Center(
          child: GraphView(
            graph: graph,
            animated: true,
            algorithm: SugiyamaAlgorithm(
              graphBuilder,
            ),
            paint: Paint()
              ..color = Colors.black
              ..strokeWidth = 1
              ..style = PaintingStyle.stroke,
            builder: (Node node) {
              var folderNode = folders.firstWhereOrNull(
                (element) => element.id == node.key?.value,
              );
              var noteNode = notes.firstWhereOrNull(
                (element) => element.id == node.key?.value,
              );
              debugPrint('assda node value ${node.key?.value}');

              return nodeItem(data: folderNode ?? noteNode);
            },
          ),
        ),
      ),
    );
  }

  Widget nodeItem<T>({required T data}) {
    if (data is FolderModel) {
      return nodeItemContainer(
          title: data.name, isFolder: true, id: data.id, data: data);
    } else if (data is NoteModel) {
      return nodeItemContainer(
          title: data.name, isFolder: false, id: data.id, data: data);
    } else {
      return Container();
    }
  }

  Widget nodeItemContainer<T>(
      {required String title,
      required bool isFolder,
      required String id,
      required T data}) {
    return GestureDetector(
      onTap: () {
        if (isFolder) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MobileFolderPage(
                id: id,
                title: title,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MobileNotePage(
                model: data as NoteModel,
              ),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isFolder ? ColorPalette.pastelGreen : ColorPalette.pastelBlue,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: CommonUtils.subtitleStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
