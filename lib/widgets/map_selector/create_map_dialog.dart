import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class CreateMapDialog extends StatefulWidget {
  const CreateMapDialog({Key? key}) : super(key: key);

  @override
  _CreateMapDialogState createState() => _CreateMapDialogState();
}

class _CreateMapDialogState extends State<CreateMapDialog> {

  String? _imgPath;

  void chooseImage() async {
    var imageResult = await FilePicker.platform.pickFiles(
      type: FileType.custom, 
      allowedExtensions: ['png', 'jpg', 'jpeg']
    );

    if (imageResult == null) return;

    setState(() {
      _imgPath = imageResult.files.single.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create Map'),
      content: Container(
        constraints: const BoxConstraints(maxHeight: 320),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AspectRatio(
              aspectRatio: 16/9, 
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: const BoxConstraints(maxHeight: 96),
                child: _imgPath != null ? Image.file(File(_imgPath!)) : null,
              )
            ),

            const SizedBox(height: 16),

            ElevatedButton(onPressed: chooseImage, child: const Text("Choose Image")),

            const SizedBox(height: 16),

            const TextField(
              decoration: InputDecoration(
                labelText: 'Map Name'
              )
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {}, 
              child: const Text("Add") 
            )

          ],
        ) 
      )
    );
  }
}