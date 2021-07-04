import 'package:flutter/material.dart';
import 'package:mobile_anwendungen_flutter/Veranstaltung.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class VeranstaltungAnlegen extends StatefulWidget {
  DateTime _datum;
  VeranstaltungAnlegen(DateTime date) {
    this._datum = _datum;
  }

  @override
  _VeranstaltungAnlegenState createState() => _VeranstaltungAnlegenState();
}

class _VeranstaltungAnlegenState extends State<VeranstaltungAnlegen> {
  _VeranstaltungAnlegenState({this.datum}) : super();

  final DateTime datum;

  final _titelController = TextEditingController();
  final _teilnehmerAnzahlController = TextEditingController();
  final _uhrzeitController = TextEditingController();
  int _stufe;
  final _beschreibungController = TextEditingController();
  final _zielController = TextEditingController();
  final _zoomLinkController = TextEditingController();

  @override
  void dispose() {
    _titelController.dispose();
    _teilnehmerAnzahlController.dispose();
    _uhrzeitController.dispose();
    _beschreibungController.dispose();
    _zielController.dispose();
    _zoomLinkController.dispose();
    super.dispose();
  }

  Map<int, String> map = {0: "Leicht", 1: "Mittel", 2: "Schwierig"};

  _buildTeilnehmerAnzahl() {
    return TextField(
        decoration: InputDecoration(
            hintText: 'Bitte maximale Teilnehmeranzahl eingeben',
            labelText: 'Max. Teilnehmeranzahl'),
        controller: _titelController,
        enabled: true);
  }

  _buildTitel() {
    return TextField(
        decoration: InputDecoration(
            hintText: 'Bitte Titel der Veranstaltung eingeben',
            labelText: 'Titel'),
        controller: _titelController,
        enabled: true);
  }

  _buildUhrzeit() {
    return TextField(
        decoration: InputDecoration(
            hintText: 'Bitte Uhrzeit eingeben (HH:MM-HH:MM)',
            labelText: 'Uhrzeit'),
        controller: _titelController,
        enabled: true);
  }

  _buildStufe() {
    return DropdownButton(
      value: _stufe,
      onChanged: (newValue) {
        setState(() {
          _stufe = newValue;
        });
      },
      items: map.keys.map((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(map[e]),
        );
      }).toList(),
      isExpanded: true,
      hint: Text("Schwierigkeitsgrad"),
    );
  }

  _buildBeschreibung() {
    return TextField(
        decoration: InputDecoration(
            hintText: 'Bitte Beschreibung zur Veranstaltung eingeben',
            labelText: 'Beschreibung'),
        controller: _titelController,
        enabled: true);
  }

  // _buildZiel() {}

  _buildZoomLink() {
    return TextField(
        decoration: InputDecoration(
            hintText: 'Bitte Zoom-Link zur Veranstaltung eingeben',
            labelText: 'Zoom-Link'),
        controller: _titelController,
        enabled: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Veranstaltung Anlegen")),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTitel(),
              _buildTeilnehmerAnzahl(),
              // _buildDatum(),
              _buildUhrzeit(),
              _buildStufe(),
              _buildBeschreibung(),
              // _buildZiel(),
              _buildZoomLink(),
              SizedBox(height: 100),
              ElevatedButton(
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  saveVeranstaltung();
                },
              )
            ],
          ),
        ));
  }

  saveVeranstaltung() {
    Veranstaltung veranstaltung = Veranstaltung(
      titel: _titelController.text,
      teilnehmeranzahl: int.parse(_teilnehmerAnzahlController.text),
      uhrzeit: _uhrzeitController.text,
      stufe: _stufe,
      beschreibung: _beschreibungController.text,
      ziel: _zielController.text,
      zoomLink: _zoomLinkController.text,
      datum: datum,
    );
    print(veranstaltung.titel);
    print(veranstaltung.teilnehmeranzahl);
    print(veranstaltung.uhrzeit);
    print(veranstaltung.stufe);
    print(veranstaltung.beschreibung);
    print(veranstaltung.ziel);
    print(veranstaltung.zoomLink);
    print(veranstaltung.datum);

    // Future<String> futureVeranstaltung = _saveVeranstaltung(veranstaltung);
  }

  Future<String> _saveVeranstaltung(Veranstaltung veranstaltung) async {
    final _response = await http.get(
        Uri.parse('localhost:8081/Weblexikon_Server/VeranstaltungAnlegen?' +
            'benutzerId=52257ef3-a9d8-464f-afd8-1f2d0d484ff6&'
                'titel=' +
            veranstaltung.titel +
            '&teilnehmeranzahl=' +
            veranstaltung.teilnehmeranzahl.toString() +
            '&uhrzeit=' +
            veranstaltung.uhrzeit +
            '&datum=' +
            veranstaltung.datum.toString() +
            '&stufe=' +
            veranstaltung.stufe.toString() +
            '&beschreibung=' +
            veranstaltung.beschreibung +
            '&ziel=' +
            veranstaltung.ziel +
            '&zoom_link=' +
            veranstaltung.zoomLink));
  }
}
