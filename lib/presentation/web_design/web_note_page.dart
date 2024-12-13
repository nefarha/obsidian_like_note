import 'dart:async';

import 'package:flutter/material.dart';
import 'package:obsidian_like_note/core/color_palette.dart';
import 'package:obsidian_like_note/core/common_utils.dart';
import 'package:obsidian_like_note/infrastructure/interfaces/i_note_repository.dart';
import 'package:obsidian_like_note/infrastructure/model/note/note_model.dart';

class WebNotePage extends StatefulWidget {
  const WebNotePage({super.key, required this.model});

  final NoteModel model;
  @override
  State<WebNotePage> createState() => _WebNotePageState();
}

class _WebNotePageState extends State<WebNotePage> {
  final _noteRepository = INoteRepository.isntance;

  Timer? _debounce;

  TextEditingController get textController =>
      TextEditingController(text: widget.model.text);

  void _onTextChanged(String text) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      debugPrint('assda $text');
      _noteRepository
          .editNote(
              id: widget.model.id, newModel: widget.model.copyWith(text: text))
          .run();
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
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
          widget.model.name,
          style: CommonUtils.headerStyle.copyWith(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                maxLines: null,
                autofocus: true,
                controller: textController,
                cursorColor: ColorPalette.pastelGreen,
                onChanged: (value) {
                  _onTextChanged(value);
                },
                decoration: const InputDecoration(
                  hintText: 'Write here',
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
