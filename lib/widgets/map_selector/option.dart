import 'package:flutter/material.dart';
import '../../classes/map.dart';
import '../misc/grow_on_hover.dart';

class Option extends StatelessWidget {

  final Map map;

  const Option({Key? key, required this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imgPath = map.imgPath ?? 'assets/images/default.png';

    return GrowOnHover(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Card(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.stretch,
            
            children: [   
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.grey[400],
                  child: Image(
                    image: AssetImage(imgPath),
                  )
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    map.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    )
                  )
                ) 
              )
            ],
          )
        )
      )
    );


    
  }

}