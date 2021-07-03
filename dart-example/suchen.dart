import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'eintrag.dart';

// Define a custom Form widget.
class SucheScreen extends StatefulWidget {
  @override
  _SucheScreenState createState() => _SucheScreenState();
}

class _SucheScreenState extends State<SucheScreen> {

  final _begriffController = TextEditingController();
  final  _definitionController = TextEditingController();


  @override
  void dispose() {
    _begriffController.dispose();
    _definitionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suchen'),
      ),
      body: Column(children: [
        TextField(
          decoration: InputDecoration(
              hintText: 'Bitte Begriff eingeben', labelText: 'Begriff'),
          controller: _begriffController,
        ),
        TextField(
        decoration: InputDecoration(
            hintText: 'Definition', labelText: 'Definition'),
            controller: _definitionController ,
        enabled: false),
      ]),
      floatingActionButton:
        FloatingActionButton.extended(
        onPressed: () {
          String begriff = _begriffController.text;
          Future<Eintrag> futureEintrag = _fetchEintrag(begriff);
          futureEintrag.then((Eintrag eintrag) => {_definitionController.text=eintrag.definition})
          .catchError(throw Exception('Fehler beim Zugriff auf das Lexikon'));
        },
        label: Text ('Suchen'),
      ),

    );
  }
}

Future<Eintrag> _fetchEintrag(String begriff) async {
  final _response = await http.get(Uri.parse(
      'http://10.0.2.2:8080/Weblexikon_Server/EintragSuchen?begriff='+begriff));

  if (_response.statusCode == 200) {
    return Eintrag.fromJson(jsonDecode(_response.body));
  } else {
    throw Exception('Failed to load Begriff');
  }
}


