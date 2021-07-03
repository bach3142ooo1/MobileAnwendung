import 'package:flutter/material.dart';
import 'package:mobile_anwendungen_flutter/VeranstaltungAnlegen.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.teal,
      ),
      home: SportonaHomePage(title: 'Sportana Home Page'),
    );
  }
}

class SportonaHomePage extends StatefulWidget {
  SportonaHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SportonaHomePageState createState() => _SportonaHomePageState();
}

class _SportonaHomePageState extends State<SportonaHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
            children: [
              OutlinedButton(
                child: Text('Veranstaltung anlegen'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return VeranstaltungAnlegen();
                    }),
                  );
                },
              ),
            ]
        ),
      ),
    );
  }
}
