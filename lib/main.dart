import 'dart:io';

import 'package:flutter/material.dart';
 import 'package:provider/provider.dart'; 
import 'package:window_size/window_size.dart';

import 'pages/home.dart';
//import 'pages/map_selector.dart';

import 'classes/server.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    setWindowTitle('Stormworks Path Drawer');
    setWindowMinSize(const Size(800, 600));
    setWindowMaxSize(Size.infinite);
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => Server(),
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
