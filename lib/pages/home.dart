import 'package:flutter/material.dart';
import '../widgets/home/server_manager.dart';
import '../widgets/home/paths_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: const [
                Expanded(
                  flex: 0,
                  child: ServerManager()
                ),
                Expanded(child: PathsList()),
              ]
            )
          )
        ),
      )
    );
  }
}