import 'package:flutter/material.dart';

class CreateMapDialog extends StatefulWidget {
  const CreateMapDialog({Key? key}) : super(key: key);

  @override
  _CreateMapDialogState createState() => _CreateMapDialogState();
}

class _CreateMapDialogState extends State<CreateMapDialog> {
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
                )
              )
            ),

            const SizedBox(height: 16),

            ElevatedButton(onPressed: () {}, child: const Text("Choose Image")),

            const SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Map Name'
              ),
              onSubmitted: (value) {

              }
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