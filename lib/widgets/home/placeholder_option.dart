import 'package:flutter/material.dart';
import '../grow_on_hover.dart';

class PlaceholderOption extends StatelessWidget {

  const PlaceholderOption({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  child: const Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.add, size: 96, color: Colors.white),
                  )
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: FractionallySizedBox(
                    widthFactor: 0.6,
                    heightFactor: 1,
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
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