import 'package:alfred/alfred.dart';
import 'package:flutter/material.dart';

class Server extends ChangeNotifier {

  static int defaultPort = 3000;

  final Alfred app;

  int port = defaultPort;
  bool running = false;
  bool loading = false;

  Server():
    app = Alfred() 
  {
    setRoutes();
  }

  setRoutes() {
    app.get('/', (req, res) {
      res.send('Hello World!');
    });
  }

  Future<void> start(int port) async {

    if(loading) return;
    loading = true;
    
    this.port = port;
    
    await app.listen(port).whenComplete(() {
      loading = false;
    });

    running = true;

    notifyListeners();
  }

  Future<void> stop() async {
 
    if(loading) return;
    loading = true;
    
    await app.close().whenComplete(() {
      loading = false;
    });

    running = false;

    notifyListeners();
 
  }
}