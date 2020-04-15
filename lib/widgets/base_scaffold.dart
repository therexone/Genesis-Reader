import 'package:flutter/material.dart';
import 'package:genesis_reader/constants.dart';
import 'package:url_launcher/url_launcher.dart' as url;

class BaseScaffold extends StatelessWidget {
  BaseScaffold({this.subHeading, this.mainWidget, this.searchWidget});

  final String subHeading;
  final Widget searchWidget;
  final Widget mainWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xff121212),
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Genesis Reader',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Poppins'),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'an open source library genesis reader',
                      style: kListTextStyle,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Image.asset(
                  'assets/images/logo-book.png',
                  height: 125.0,
                  width: 122.0,
                ),
              ),
              ListTile(
                title: Text(
                  'Disclaimer',
                  style: TextStyle(color: Colors.white60),
                  textAlign: TextAlign.center,
                ),
                onTap: () => Navigator.pushNamed(context, '/disclaimer'),
              ),
              ListTile(
                title: Text(
                  'Library Genesis',
                  style: TextStyle(color: Colors.white60),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  url.launch('https://en.wikipedia.org/wiki/Library_Genesis');
                },
              ),
              ListTile(
                title: Text(
                  'Library Genesis API',
                  style: TextStyle(color: Colors.white60),
                  textAlign: TextAlign.center,
                ),
                onTap: () =>
                    {url.launch('https://github.com/therexone/libgen-api')},
              ),
              InkWell(
                onTap: () {
                  url.launch('https://github.com/therexone/');
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  decoration: BoxDecoration(
                    color: Color(0xff121212),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/github-icon.png',
                        height: 37,
                        width: 37,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Contribute on Github',
                        style: TextStyle(color: Colors.white60),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
                  padding: const EdgeInsets.only(top: 10.0), child: mainWidget),
            )
          ],
        ),
      ),
    );
  }
}
