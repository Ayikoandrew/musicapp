import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          content,
        ),
      ),
    );
}

Future<File?> pickAudioFile() async {
  try {
    final pickFileRes =
        await FilePicker.platform.pickFiles(type: FileType.audio);

    if (pickFileRes != null) {
      return File(pickFileRes.files.first.xFile.path);
    }
    return null;
  } catch (e) {
    return null;
  }
}

Future<File?> pickImageFile() async {
  try {
    final pickFileRes =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (pickFileRes != null) {
      return File(pickFileRes.files.first.xFile.path);
    }
    return null;
  } catch (e) {
    return null;
  }
}
