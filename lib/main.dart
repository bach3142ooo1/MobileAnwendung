import 'package:flutter/material.dart';
import 'package:mobile_anwendungen_flutter/VeranstaltungAnlegen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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

class SportonaHomePage extends StatefulWidget {
  SportonaHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SportonaHomePageState createState() => _SportonaHomePageState();
}

class _SportonaHomePageState extends State<SportonaHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: SfCalendar(
          view: CalendarView.month,
          onTap: (calendarTapDetails) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              print(calendarTapDetails.date);
              return VeranstaltungAnlegen(calendarTapDetails.date);
            }));
          },
        )
      );
  }
}
