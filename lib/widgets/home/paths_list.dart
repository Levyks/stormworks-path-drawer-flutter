import 'package:flutter/material.dart';
import '../../pages/map_selector.dart';

class PathsList extends StatefulWidget {
  const PathsList({Key? key}) : super(key: key);

  @override
  _PathsListState createState() => _PathsListState();
}

class _PathsListState extends State<PathsList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [

                Expanded(
                  child: Text(
                    'Paths',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const MapSelector())
                    );
                  }, 
                  child: const Icon(Icons.add)
                )

              ],
            ),

            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Path ${index + 1}'),
                      subtitle: const Text('Map: algo'),
                      trailing: IconButton(
                        onPressed: () {
                         
                        }, 
                        color: Colors.red,
                        tooltip: "Delete",
                        icon: const Icon(Icons.delete)
                      ),
                      onTap: () {
                        
                      },
                    );
                  },
                )
              ),
            )

          ],
        )
      )
    );
  }
}