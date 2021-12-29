import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart'; 

import '../../classes/server.dart';

class ServerManager extends StatefulWidget {
  const ServerManager({Key? key}) : super(key: key);

  @override
  _ServerManagerState createState() => _ServerManagerState();
}

class _ServerManagerState extends State<ServerManager> {

  final _controller = TextEditingController(text: Server.defaultPort.toString());
  String? _errorText;

  void setError(dynamic error) {
    setState(() {
      _errorText = error == null ? error : error.toString();
    });
  }

  void handleStartStopPress(Server server) async {
      
    if (server.running) {

      await server.stop().then((_) {
        setError(null);
      }).catchError((error) {
        setError(error);
      });
      
    } else {

      int? port = int.tryParse(_controller.text);

      if (port == null) {
        throw 'Invalid port';
      }

      await server.start(port).then((_) {
        setError(null);
      }).catchError((error) {
        setError(error);
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Consumer<Server>(
          builder: (context, server, child) {
            _controller.text = server.port.toString();
            return Column(
              children: [
                const Text('Server', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Expanded(child: TextField(

                      decoration: InputDecoration(
                        labelText: 'Port',
                        hintText: 'Port',
                        labelStyle: TextStyle(color: server.running ? Colors.grey : Colors.black),
                        errorText: _errorText,
                        errorMaxLines: 5
                      ),

                      enabled: !server.running,
                      style: TextStyle(color: server.running ? Colors.grey : Colors.black),
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                    )),

                    Container(
                      margin: const EdgeInsets.only(left: 20, top: 20),
                      child: ElevatedButton(
                        onPressed: () => handleStartStopPress(server), 
                        child: Icon(server.running ? Icons.stop_sharp : Icons.play_arrow),
                        style: ElevatedButton.styleFrom(
                          primary: server.running ? Colors.red : Colors.green
                        ),
                      ),
                    )

                  ]
                )
              ]
            );
          }
        )
      )
    );
  }
}