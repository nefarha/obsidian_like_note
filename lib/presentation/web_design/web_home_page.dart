import 'package:flutter/material.dart';
import 'package:obsidian_like_note/core/assets_url.dart';
import 'package:obsidian_like_note/core/color_palette.dart';
import 'package:obsidian_like_note/core/common_utils.dart';
import 'package:obsidian_like_note/infrastructure/interfaces/i_folder_repository.dart';
import 'package:obsidian_like_note/infrastructure/model/folder/folder_model.dart';
import 'package:fpdart/fpdart.dart' as fp;
import 'package:obsidian_like_note/presentation/graph_page.dart';
import 'package:obsidian_like_note/presentation/web_design/web_folder_page.dart';
import 'package:uuid/uuid.dart';

class WebHomePage extends StatefulWidget {
  const WebHomePage({super.key});

  @override
  State<WebHomePage> createState() => _WebHomePageState();
}

class _WebHomePageState extends State<WebHomePage> {
  final _folderRepository = IFolderRepository.instance;
  final uid = const Uuid();

  var optionOrFolders =
      const fp.Option<fp.Either<String, List<FolderModel>>>.none();

  final folderNameController = TextEditingController();

  FolderModel? selectedFolder;

  Future getFolders() async {
    var result = await _folderRepository.getAllFolder().run();

    setState(() {
      optionOrFolders = fp.Option.of(result);
    });
  }

  createFolder({required BuildContext contextDialog}) async {
    if (folderNameController.text.isNotEmpty) {
      final model = FolderModel(
        id: uid.v1(),
        name: folderNameController.text,
        dateTime: DateTime.now(),
      );

      var result = await _folderRepository.createFolder(model: model).run();
      result.match(
        (l) => null,
        (r) {
          folderNameController.clear();
          Navigator.pop(contextDialog);
          getFolders();
        },
      );
    }
  }

  createFolderDialog() {
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
                'Create Folder',
                style: CommonUtils.titleStyle,
              ),
              TextField(
                maxLines: 1,
                controller: folderNameController,
                cursorColor: ColorPalette.pastelGreen,
                decoration: const InputDecoration(
                  hintText: 'enter folder name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  await createFolder(contextDialog: context);
                },
                child: const Text('create'),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    getFolders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: optionOrFolders.match(
          () => const Center(
            child: CircularProgressIndicator(),
          ),
          (t) => t.match(
            (l) => Center(
              child: Text(l),
            ),
            (r) => r.isEmpty
                ? Center(
                    child: _WebNoteEmpty(
                      createFolder: () {
                        createFolderDialog();
                      },
                    ),
                  )
                : Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AssetsUrl.iconImage,
                              width: 100,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Welcome to\nGraph your notes',
                              style: CommonUtils.headerStyle
                                  .copyWith(fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (selectedFolder == null)
                                  GestureDetector(
                                    onTap: () {
                                      createFolder(contextDialog: context);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 10,
                                      ),
                                      width: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: ColorPalette.pastelBrown,
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorPalette.pastelBrown
                                                .withOpacity(0.5),
                                            spreadRadius: 0,
                                            blurRadius: 0,
                                            offset: const Offset(5, 7),
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.create_new_folder_outlined,
                                            color: ColorPalette.pastelGrey,
                                            size: 15,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Create',
                                            style: CommonUtils.titleStyle
                                                .copyWith(
                                                    color:
                                                        ColorPalette.pastelGrey,
                                                    fontSize: 12),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                const SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const GraphPage(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: ColorPalette.pastelGreen,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorPalette.pastelGreen
                                              .withOpacity(0.5),
                                          spreadRadius: 0,
                                          blurRadius: 0,
                                          offset: const Offset(5, 7),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.auto_graph,
                                          size: 15,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Graph',
                                          style:
                                              CommonUtils.titleStyle.copyWith(
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        selectedFolder != null
                            ? WebFolderPage(
                                model: selectedFolder!,
                                onTapBack: () {
                                  setState(() {
                                    selectedFolder = null;
                                  });
                                },
                              )
                            : _WebNoteExists(
                                folders: r,
                                selectFolder: (folderModel) {
                                  setState(() {
                                    selectedFolder = folderModel;
                                  });
                                },
                                folderRepository: _folderRepository,
                                getFolders: getFolders),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class _WebNoteEmpty extends StatelessWidget {
  const _WebNoteEmpty({required this.createFolder});

  final Function()? createFolder;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AssetsUrl.iconImage,
          width: 150,
        ),
        const SizedBox(
          width: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to\nGraph your notes',
              style: CommonUtils.headerStyle.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: createFolder,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorPalette.pastelBrown,
                  boxShadow: [
                    BoxShadow(
                      color: ColorPalette.pastelBrown.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 0,
                      offset: const Offset(5, 7),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.create_new_folder_outlined,
                      color: ColorPalette.pastelGrey,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Create folder',
                      style: CommonUtils.titleStyle.copyWith(
                          color: ColorPalette.pastelGrey, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _WebNoteExists extends StatelessWidget {
  _WebNoteExists(
      {required this.folders,
      required this.folderRepository,
      required this.getFolders,
      required this.selectFolder});

  final IFolderRepository folderRepository;
  final Function(FolderModel folderModel) selectFolder;
  final Function()? getFolders;
  final List<FolderModel> folders;

  final folderNameController = TextEditingController();

  deleteFolder({required String id}) async {
    var result = await folderRepository.deleteFolder(id: id).run();
    debugPrint('assda $result');
    result.match(
      (l) => null,
      (r) {
        getFolders!();
      },
    );
  }

  editFolderDialog(
      {required BuildContext context, required FolderModel folderModel}) {
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
                'Create Folder',
                style: CommonUtils.titleStyle,
              ),
              TextField(
                maxLines: 1,
                controller: folderNameController,
                cursorColor: ColorPalette.pastelGreen,
                decoration: const InputDecoration(
                  hintText: 'enter folder name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  var newModel = folderModel.copyWith(
                    name: folderNameController.text,
                  );
                  var result = await folderRepository
                      .editFolder(id: folderModel.id, newModel: newModel)
                      .run();
                  result.match(
                    (l) => null,
                    (r) {
                      folderNameController.clear();
                      Navigator.of(context).pop();
                      getFolders!();
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

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Folder List',
            style: CommonUtils.headerStyle,
          ),
          const Divider(),
          Flexible(
            child: ListView.separated(
              itemBuilder: (context, index) =>
                  itemListCard(context: context, model: folders[index]),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: folders.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget itemListCard(
      {required BuildContext context, required FolderModel model}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        selectFolder(model);
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
                    Icons.folder,
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
            const SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                editFolderDialog(context: context, folderModel: model);
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
                deleteFolder(id: model.id);
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
