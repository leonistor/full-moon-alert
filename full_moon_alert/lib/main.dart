import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:full_moon_alert/app_icons.dart';

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
            child: _buttons(context),
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
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  void _handleInfo(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          final screenSize = MediaQuery.of(context).size;
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            backgroundColor: Colors.grey[50],
            child: Container(
              height: screenSize.height * 0.6,
              width: screenSize.width * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Text('ana are mere'),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.check),
                      color: Colors.white,
                      iconSize: 32.0,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _handleAlert() {
    print('pressed alert');
  }

  Widget _buttons(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: SizedBox.expand(
            child: Container(
              child: IconButton(
                icon: Icon(
                  AppIcons.info,
                  color: Colors.white,
                ),
                onPressed: () => _handleInfo(context),
              ),
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border(
                    top: _thinBorder,
                    right: _thinBorder,
                  )),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox.expand(
            child: Container(
              child: IconButton(
                icon: Icon(
                  AppIcons.bell,
                  color: Colors.white,
                ),
                onPressed: _handleAlert,
              ),
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border(
                    top: _thinBorder,
                    // right: _thinBorder,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
