import 'package:flutter/material.dart';
import 'option.dart';

import 'create_map_dialog.dart';
import 'placeholder_option.dart';
import '../misc/header.dart';

import '../../classes/map.dart';


class Menu extends StatefulWidget {
  
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();

}

class _MenuState extends State<Menu> {

  final int pageSize = 6;
  final List<Map> maps = Map.getMaps();
  
  int currentPage = 0;

  int get numberOfPages => maps.length ~/ pageSize + (maps.length % pageSize == 0 ? 0 : 1);

  void decrementPage() {
    setState(() {
      currentPage--;
    });
  }

  void incrementPage() {
    setState(() {
      currentPage++;
    });
  }

  void createMap() {
    showDialog(
      context: context, 
      builder: (context) => const CreateMapDialog()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Header(title: "Choose a map"),

        Column(
          children:[
            Container(
              constraints: const BoxConstraints(maxWidth: 800),
              margin: const EdgeInsets.only(bottom: 20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 30,
                  crossAxisCount: 3,
                  childAspectRatio: 4/3,
                ),
                shrinkWrap: true,
                itemCount: pageSize,
                itemBuilder: (context, index) {
                  var realIndex = currentPage * pageSize + index; 
                  return realIndex < maps.length ? 
                    Option(
                      map: maps[realIndex],

                    ) : 
                    PlaceholderOption(
                      onTap: createMap,
                    );
                },
              )
            ),
            ElevatedButton(onPressed: createMap, child: const Text("New Map"))
          ]
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: currentPage > 0 ? decrementPage : null, child: const Icon(Icons.arrow_back)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text((currentPage + 1).toString(), style: const TextStyle(fontSize: 24)),
            ),
            const Text("/"),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(numberOfPages.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            ),
            ElevatedButton(onPressed: (currentPage + 1) < numberOfPages ? incrementPage : null, child: const Icon(Icons.arrow_forward))
          ],
        )

      ],
    );
  }
}