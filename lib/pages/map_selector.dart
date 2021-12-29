import 'package:flutter/material.dart';
import '../widgets/map_selector/menu.dart';

class MapSelector extends StatelessWidget {
  const MapSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        padding: const EdgeInsets.all(10),
        child: const Center(
          child: Menu(),
        ),
      )
    );
  }
}