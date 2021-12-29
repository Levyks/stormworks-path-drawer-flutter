import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Map {
  
  String id;
  String name;
  String? imgPath;
  bool addedByUser = false;

  Map(this.name, {this.imgPath, this.addedByUser = false, id}):
    id = id ?? uuid.v4();

  static List<Map> getMaps() {
    return defaultMaps;
  }

  static List<Map> defaultMaps = [
    Map('Isle Of Donkk', imgPath: 'assets/img/maps/isle-of-donkk.png'),
    Map('Isle Of Donkk + Camodo', imgPath: 'assets/img/maps/donkk-camodo.png'),
    Map('Main Island', imgPath: 'assets/img/maps/main-island.png'),
    Map('Isle Of Donkk', imgPath: 'assets/img/maps/isle-of-donkk.png'),
    Map('Isle Of Donkk + Camodo', imgPath: 'assets/img/maps/donkk-camodo.png'),
    Map('Main Island', imgPath: 'assets/img/maps/main-island.png'),
  ];

}