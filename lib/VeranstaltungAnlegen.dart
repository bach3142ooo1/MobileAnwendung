import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_anwendungen_flutter/Veranstaltung.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:add_2_calendar/add_2_calendar.dart';

// Veranstaltung Anlegen form definieren
class VeranstaltungAnlegen extends StatefulWidget {
  DateTime _datum;

  // Konstruktor
  VeranstaltungAnlegen(DateTime date) {
    this._datum = date;
  }

  @override
  _VeranstaltungAnlegenState createState() =>
      _VeranstaltungAnlegenState(_datum);
}
// Veranstaltatung anlegen Screen erstellen
class _VeranstaltungAnlegenState extends State<VeranstaltungAnlegen> {
  _VeranstaltungAnlegenState(DateTime datum)
  {
    this.datum = datum;
  }

  DateTime datum;

  // Controller definieren, um auf die Texteingaben zuzugreifen
  final _titelController = TextEditingController();
  final _teilnehmerAnzahlController = TextEditingController();
  final _uhrzeitController = TextEditingController();
  int _stufe;
  final _beschreibungController = TextEditingController();
  final _zielController = TextEditingController();
  final _zoomLinkController = TextEditingController();

  // Dispose Methoden, um Memory Leaks zu verhindern
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

  // Map für den Schwierigkeitsgrad
  Map<int, String> map = {0: "Leicht", 1: "Mittel", 2: "Schwierig"};

  // Build Methode für Textbox für Teilnehmeranzahl
  _buildTeilnehmerAnzahl() {
    return TextField(
        decoration: InputDecoration(
            hintText: 'Bitte maximale Teilnehmeranzahl eingeben',
            labelText: 'Max. Teilnehmeranzahl'),
        controller: _teilnehmerAnzahlController,
        enabled: true);
  }

  // Build Methode für Textbox für Titel
  _buildTitel() {
    return TextField(
        decoration: InputDecoration(
            hintText: 'Bitte Titel der Veranstaltung eingeben',
            labelText: 'Titel'),
        controller: _titelController,
        enabled: true);
  }

  // Build Methode für Textbox für Uhrzeit
  _buildUhrzeit() {
    return TextField(
        decoration: InputDecoration(
            hintText: 'Bitte Uhrzeit eingeben (HH:MM-HH:MM)',
            labelText: 'Uhrzeit'),
        controller: _uhrzeitController,
        enabled: true);
  }

  // Build Methode für Textbox für Schwierigkeitsgrad
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

  // Build Methode für Textbox für Beschreibung
  _buildBeschreibung() {
    return TextField(
        decoration: InputDecoration(
            hintText: 'Bitte Beschreibung zur Veranstaltung eingeben',
            labelText: 'Beschreibung'),
        controller: _beschreibungController,
        enabled: true);
  }

  // Build Methode für Textbox für Ziel der Veranstaltung
  _buildZiel() {
    return TextField(
        decoration: InputDecoration(
            hintText: 'Bitte Ziel der Veranstaltung eingeben',
            labelText: 'Ziel'),
        controller: _zielController,
        enabled: true);
  }

  // Build Methode für Textbox für Zoom-Link
  _buildZoomLink() {
    return TextField(
        decoration: InputDecoration(
            hintText: 'Bitte Zoom-Link zur Veranstaltung eingeben',
            labelText: 'Zoom-Link'),
        controller: _zoomLinkController,
        enabled: true);
  }

  // UI Erstellen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Veranstaltung Anlegen")),
        body: Container(
          margin: EdgeInsets.all(24),
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTitel(),
              _buildTeilnehmerAnzahl(),
              _buildUhrzeit(),
              _buildStufe(),
              _buildBeschreibung(),
              _buildZiel(),
              _buildZoomLink(),
              SizedBox(height: 100),
              ElevatedButton(
                child: Text(
                  "Anlegen",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  speichernVeranstaltung();
                },
              ),
              ElevatedButton(
                child:Text(
                  "Lokal speichern",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                  onPressed: () async{
                    // Veranstaltung in den lokalen Kalender hinzufügen
                    DateTime startDate = DateTime.parse(datum.toString().substring(0,10) + " " +_uhrzeitController.text.substring(0,5));
                    DateTime endDate = DateTime.parse(datum.toString().substring(0,10) + " " +_uhrzeitController.text.substring(6,11));
                    Event event = Event(
                      title: _titelController.text,
                      description: _beschreibungController.text,
                      startDate: startDate,
                      location: _zoomLinkController.text,
                      endDate: endDate
                    );
                    Add2Calendar.addEvent2Cal(event);
                  }
              )
            ],
          )),
        ));
  }



  // Veranstaltung Speichern Methode
  speichernVeranstaltung() {
    // Validierung der Eingaben
    int teilnehmerAnzahl = int.tryParse(_teilnehmerAnzahlController.text) ?? 0;
    if (teilnehmerAnzahl == 0) {
      dialogAnzeigen("Validierung","Falscher Format der Teilnehmeranzahl");
    } else if (!validateUhrzeit(_uhrzeitController.text)) {
      dialogAnzeigen("Validierung","Falscher Format der Uhrzeit");
    }  else {
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
      // Die Veranstaltung in die Datenbank hinzufügen
      _saveVeranstaltung(veranstaltung);
    }

  }

  Future<dynamic> dialogAnzeigen(String title,String text) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text(title),
              content: Text(text),
              actions: [
                CupertinoDialogAction(
                    child: Text("Ok"), onPressed: () => Navigator.pop(context))
              ],
            ));
  }

  Future<String> _saveVeranstaltung(Veranstaltung veranstaltung) async {
    String header;

    // Wenn der Nutzer die Anwendung mit Browser läuft
    if(kIsWeb){
      header = "localhost";
    }

    // Wenn der Nutzer die Anwendung mit dem Emulator läuft - Emulator unterstützt kein localhost
    else if(Platform.isAndroid){
      header = "10.0.2.2";
    }else{
      header = "localhost";
    }

    // Request um Daten in Datenbank zu schicken
    var _response = await http.get(
        Uri.parse('http://$header:8081/Weblexikon_Server/VeranstaltungAnlegen?' +
            'benutzerId=52257ef3-a9d8-464f-afd8-1f2d0d484ff6&'
                'titel=' +
            veranstaltung.titel +
            '&teilnehmeranzahl=' +
            veranstaltung.teilnehmeranzahl.toString() +
            '&uhrzeit=' +
            veranstaltung.uhrzeit +
            '&datum=' +
            veranstaltung.datum.toString().split(' ')[0] +
            '&stufe=' +
            veranstaltung.stufe.toString() +
            '&beschreibung=' +
            veranstaltung.beschreibung +
            '&ziel=' +
            veranstaltung.ziel +
            '&zoom_link=' +
            veranstaltung.zoomLink));

    // Überprüfung ob der Request erfolgreich/fehlgeschlagen ist
    if (_response.statusCode == 200) {
      dialogAnzeigen("Status", "Erfolgreich angelegt");
      return _response.body;
    } else {
      dialogAnzeigen("Status", "Fehler beim Anlegen");
    }
  }

  // Eingegebene Uhzeit validieren
  bool validateUhrzeit(String uhrzeit) {
    var regexUhrzeit = new RegExp(r"\d\d:\d\d-\d\d:\d\d");
    if (!regexUhrzeit.hasMatch(uhrzeit)) return false;

    var uhrzeitElement = uhrzeit.replaceAll(" ", "").split('-');
    var from = uhrzeitElement[0];
    var to = uhrzeitElement[1];
    var fromHour = int.parse(from.split(":")[0]);
    var fromMinute = int.parse(from.split(":")[1]);
    var toHour = int.parse(to.split(":")[0]);
    var toMinute = int.parse(to.split(":")[1]);

    return fromHour < 24 && fromMinute < 60 && toHour < 24 && toMinute < 60;
  }
}
