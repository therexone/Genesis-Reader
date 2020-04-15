import 'package:flutter/material.dart';


class NoBooks extends StatelessWidget {

  NoBooks({this.helpText});

  final String helpText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Center(
              child: Opacity(
            child: Image.asset(
              'assets/images/404.png',
            ),
            opacity: 0.2,
          )),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'No Books found.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(helpText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54)),
            ],
          )),
        ],
      ),
    );
  }
}