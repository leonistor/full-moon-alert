import 'package:flutter/material.dart';

void main() => runApp(FullMoonApp());

class FullMoonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Full Moon Alert',
      theme: ThemeData(fontFamily: 'Work Sans'),
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
              child: Center(
                child: textInfo(
                    label: 'now', info: 'first quarter', isTitle: true),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }

  RichText textInfo({String label, String info, bool isTitle = false}) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: isTitle ? 24.0 : 20.0, color: Colors.white),
        children: [
          TextSpan(
            text: label + ' ',
            style: TextStyle(fontWeight: FontWeight.w100),
          ),
          TextSpan(
            text: info,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
