import 'package:flutter/material.dart';

import 'anlegen.dart';
import 'suchen.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kleines Online Lexikon'),
      ),
      body: Center( child:
      Column(
        children: [OutlinedButton(
          child: Text('Begriff suchen'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return SucheScreen();
              }),
            );
          },
        ),
          OutlinedButton(
          child: Text('Eintrag anlegen'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return AnlageScreen();
              }),
            );
          },
        ),]
      ),
      ),
    );
  }
}