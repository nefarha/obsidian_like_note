import 'package:flutter/material.dart';
import 'package:obsidian_like_note/core/color_palette.dart';
import 'package:obsidian_like_note/core/common_utils.dart';
import 'package:obsidian_like_note/presentation/mobile_design/mobile_note_page/mobile_note_page.dart';

class MobileFolderPage extends StatefulWidget {
  const MobileFolderPage({super.key, required this.id, required this.title});

  final String title;
  final String id;

  @override
  State<MobileFolderPage> createState() => _MobileFolderPageState();
}

class _MobileFolderPageState extends State<MobileFolderPage> {
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
                  Container(
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
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Flexible(
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      noteListCard(context: context),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget noteListCard({required BuildContext context}) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MobileNotePage(),
          ),
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
                  Text('Notes Name',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CommonUtils.titleStyle),
                ],
              ),
            ),
            const Icon(
              Icons.edit,
              color: ColorPalette.pastelBrown,
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.delete,
              color: ColorPalette.pastelBrown,
            ),
          ],
        ),
      ),
    );
  }
}
