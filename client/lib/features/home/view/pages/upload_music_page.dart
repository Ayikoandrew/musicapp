import 'package:client/core/theme/app_palette.dart';
import 'package:client/core/widgets/custom_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadMusicPage extends ConsumerStatefulWidget {
  const UploadMusicPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UploadMusicPageState();
}

class _UploadMusicPageState extends ConsumerState<UploadMusicPage> {
  final uploadSongController = TextEditingController();
  final artistController = TextEditingController();
  final titleController = TextEditingController();

  Color selectedColor = Pallete.cardColor;

  @override
  void dispose() {
    uploadSongController.dispose();
    artistController.dispose();
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Upload song'),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              DottedBorder(
                color: Pallete.borderColor,
                dashPattern: const [10, 4],
                radius: const Radius.circular(10),
                borderType: BorderType.RRect,
                child: const SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.folder_open,
                        size: 40,
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Select the thumbnail for your song.',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              CustomPage(
                controller: uploadSongController,
                hintText: 'Upload song',
                readOnly: true,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              CustomPage(
                controller: artistController,
                hintText: 'Artist',
                readOnly: true,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              CustomPage(
                controller: titleController,
                hintText: 'Song name',
                readOnly: false,
                onTap: () {},
              ),
              const SizedBox(height: 20),
              ColorPicker(
                pickersEnabled: const {
                  ColorPickerType.wheel: true,
                },
                color: selectedColor,
                onColorChanged: (Color color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
