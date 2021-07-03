import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'eintrag.dart';

// Define a custom Form widget.
class AnlageScreen extends StatefulWidget {
  @override
  _AnlageScreenState createState() => _AnlageScreenState();
}

class _AnlageScreenState extends State<AnlageScreen> {

  final _begriffController = TextEditingController();
  final _definitionController = TextEditingController();
  final _statusController = TextEditingController();

  @override
  void dispose() {
    _begriffController.dispose();
    _definitionController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Anlegen'),
      ),
      body: Column(children: [
        TextField(
          decoration: InputDecoration(
              hintText: 'Bitte Begriff eingeben', labelText: 'Begriff'),
          controller: _begriffController,
        ),
        TextField(
        decoration: InputDecoration(
            hintText: 'Bitte Definition eingeben', labelText: 'Definition'),
            controller: _definitionController ,
        enabled: true),
        TextField(
            decoration: InputDecoration(
                labelText: 'Status'),
            controller: _statusController ,
            enabled: false,
          ),

      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
         Eintrag eintrag = Eintrag(
             begriff: _begriffController.text,
             definition: _definitionController.text,
         );
          Future<String> futureStatus = _saveEintrag(eintrag);
           futureStatus.then((String status) => {_statusController.text=status})
          .catchError(throw Exception('Fehler beim Zugriff auf das Lexikon'));
        },
        label: Text('Eintrag anlegen'),
      ),
    );
  }
}

Future<String> _saveEintrag(Eintrag eintrag) async {
  final _response = await http.get(Uri.parse(
      'http://10.0.2.2:8080/Weblexikon_Server/EintragAnlegen?begriff='
          +eintrag.begriff+'&definition='+eintrag.definition));

  if (_response.statusCode == 200) {
    return _response.body;
  } else {
    throw Exception('Fehler beim Anlegen');
  }
}


