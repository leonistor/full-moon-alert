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
  final _thinBorder = BorderSide(
    color: Colors.grey[500],
    width: 2.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: _thinBorder),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _textInfo(label: 'now', info: 'first quarter', isTitle: true),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 8.0),
                    child: FractionallySizedBox(
                        widthFactor: 0.7,
                        child: Image.asset('assets/phases/moon_phase08.png')),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _textInfo(label: 'next', info: 'full moon'),
                  _textInfo(label: 'in', info: '18 days'),
                  _textInfo(label: 'on', info: 'Wed, April 1st'),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: _buttons(),
          ),
        ],
      ),
    );
  }

  RichText _textInfo({String label, String info, bool isTitle = false}) {
    return RichText(
      text: TextSpan(
        style: TextStyle(fontSize: isTitle ? 36.0 : 26.0, color: Colors.white),
        children: [
          TextSpan(
            text: label + ' ',
            style: TextStyle(fontWeight: FontWeight.w100),
          ),
          TextSpan(
            text: info,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _buttons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            child: Center(
              child: Text(
                'About',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border(
                  top: _thinBorder,
                  right: _thinBorder,
                )),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Center(
              child: Text(
                'Set Alert',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.grey[800],
                border: Border(
                  top: _thinBorder,
                )),
          ),
        ),
      ],
    );
  }
}
