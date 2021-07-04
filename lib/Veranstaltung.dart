import 'dart:core';

class Veranstaltung {
  String veranstaltungID;
  String titel;
  int teilnehmeranzahl;
  DateTime datum;
  int stufe;
  String uhrzeit;
  String beschreibung;
  String ziel;
  String zoomLink;

  Veranstaltung(
      {this.veranstaltungID,
      this.titel,
      this.teilnehmeranzahl,
      this.datum,
      this.stufe,
      this.uhrzeit,
      this.beschreibung,
      this.ziel,
      this.zoomLink});
}
