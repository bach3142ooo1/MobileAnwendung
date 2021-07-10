
import 'package:flutter/material.dart';
import 'package:mobile_anwendungen_flutter/VeranstaltungAnlegen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'global.dart' as global;

// Entry Point für unsere App
void main() {
  global.benutzerID = "52257ef3-a9d8-464f-afd8-1f2d0d484ff6";
  runApp(MyApp());
}

// Stateless Widget definieren
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: SportonaHomePage(title: 'Sportana Home Page'),
    );
  }
}

// Stateful Screen erstellen
class SportonaHomePage extends StatefulWidget {
  SportonaHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SportonaHomePageState createState() => _SportonaHomePageState();
}

// Kalenderübersicht Screen erstellen
class _SportonaHomePageState extends State<SportonaHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SfCalendar(
          view: CalendarView.month,
          onTap: (calendarTapDetails) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              // Das ausgewählte Datum ans neue Screen übergeben
              return VeranstaltungAnlegen(calendarTapDetails.date);
            }));
          },
        ));
  }
}
