import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {

  BaseScaffold({this.subHeading, this.mainWidget, this.searchWidget});

  final String subHeading;
  final Widget searchWidget;
  final Widget mainWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Genesis Reader',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xff121212),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            searchWidget ?? SizedBox(),
            Text(
              subHeading,
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white38, fontSize: 15.0),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: mainWidget
              ),
            )
          ],
        ),
      ),
    );
  }
}