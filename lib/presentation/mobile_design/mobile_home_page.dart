import 'package:flutter/material.dart';
import 'package:obsidian_like_note/core/assets_url.dart';
import 'package:obsidian_like_note/core/color_palette.dart';
import 'package:obsidian_like_note/core/common_utils.dart';

class MobileHomePage extends StatelessWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: _MobileNoteExists(),
        ),
      ),
    );
  }
}

class _MobileNoteEmpty extends StatelessWidget {
  const _MobileNoteEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AssetsUrl.iconImage,
          width: 100,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Welcome to\nGraph your notes',
          style: CommonUtils.headerStyle.copyWith(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                width: double.infinity,
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
            const SizedBox(
              width: 20,
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorPalette.pastelBlue,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: ColorPalette.pastelBlue.withOpacity(0.5),
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
                      Icons.folder_outlined,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Open',
                      style: CommonUtils.titleStyle.copyWith(fontSize: 12),
                    ),
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

class _MobileNoteExists extends StatelessWidget {
  const _MobileNoteExists({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Welcome to\nGraph your notes',
              style: CommonUtils.headerStyle.copyWith(fontSize: 20),
              textAlign: TextAlign.left,
            ),
            Image.asset(
              AssetsUrl.iconImage,
              width: 100,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                width: double.infinity,
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
                      'Create',
                      style: CommonUtils.titleStyle.copyWith(
                          color: ColorPalette.pastelGrey, fontSize: 12),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorPalette.pastelBlue,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: ColorPalette.pastelBlue.withOpacity(0.5),
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
                      Icons.folder_outlined,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Open',
                      style: CommonUtils.titleStyle.copyWith(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorPalette.pastelGreen,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: ColorPalette.pastelGreen.withOpacity(0.5),
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
                      Icons.auto_graph,
                      size: 15,
                      color: ColorPalette.pastelGrey,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Graph',
                      style: CommonUtils.titleStyle.copyWith(
                        fontSize: 12,
                        color: ColorPalette.pastelGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Flexible(
          child: ListView.separated(
            itemBuilder: (context, index) => itemListCard(),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: 100,
          ),
        ),
      ],
    );
  }

  Widget itemListCard() {
    return SizedBox(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Folder name',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: CommonUtils.titleStyle),
                      Text(
                        "10 note(s)",
                        style: CommonUtils.subtitleStyle,
                      ),
                    ],
                  ),
                ),
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
    );
  }
}
