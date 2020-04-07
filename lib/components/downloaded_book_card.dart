import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:http/http.dart' as http;

class DownloadedBookCard extends StatelessWidget {
  DownloadedBookCard({this.bookTitle, this.authors});

  final String bookTitle;
  final String authors;

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 20.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Exploring Python',
              style: TextStyle(fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
            Text(
              'Markus Nix   ',
              style: TextStyle(fontWeight: FontWeight.w200),
            ),
          ],
        ),
      ),
      gradient: Gradients.hotLinear,
      shadowColor:
          Gradients.hotLinear.colors.last.withOpacity(0.30),
      elevation: 8,
    );
  }
}
