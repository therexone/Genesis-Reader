import 'package:flutter/material.dart';
import 'package:genesis_reader/screens/results_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() => runApp(GenesisReader());

class GenesisReader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gensis Reader',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xff121212),
        accentColor: Color(0xff00d3a9),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/search': (context) => ResultsScreen(),
      },
    );
  }
}
