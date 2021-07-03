import 'package:flutter/material.dart';

class VeranstaltungAnlegen extends StatefulWidget {
  @override
  _VeranstaltungAnlegenState createState() => _VeranstaltungAnlegenState();
}

class _VeranstaltungAnlegenState extends State<VeranstaltungAnlegen> {

  String _titel;
  int _teilnehmerAnzahl;
  DateTime _datum;
  String _uhrzeit;
  int _stufe;
  String _beschreibung;
  String _ziel;
  String _zoomLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Veranstaltung Anlegen")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            _buildTitel(),
            _buildTeilnehmerAnzahl(),
            _buildDatum(),
            _buildUhrzeit(),
            _buildStufe(),
            _buildBeschreibung(),
            _buildZiel(),
            _buildZoomLink(),
            SizedBox(height: 100),
            ElevatedButton(
              child: Text (
                "Submit",
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
              onPressed: () {},
            )
          ],
        ),
      )
    );
  }

  _buildTitel() {}

  _buildTeilnehmerAnzahl() {}

  _buildDatum() {}

  _buildUhrzeit() {}

  _buildStufe() {}

  _buildBeschreibung() {}

  _buildZiel() {}

  _buildZoomLink() {}

}
