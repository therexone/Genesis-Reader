import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class DownloadedBookCard extends StatelessWidget {
  DownloadedBookCard({this.bookTitle});

  final String bookTitle;
  final List<LinearGradient> gradients = [
    // Gradients.aliHussien,
    // Gradients.backToFuture,
    // Gradients.blush,
    // Gradients.byDesign,
    // Gradients.cosmicFusion,
    // Gradients.coldLinear,
    Gradients.deepSpace,
    Gradients.tameer,
    Gradients.taitanum,
    Gradients.rainbowBlue,
    Gradients.hotLinear,
  ];
  final int randomNumber = Random().nextInt(5);

  @override
  Widget build(BuildContext context) {
    print(randomNumber);
    return InkWell(
      onTap: (){
        
      },
          child: GradientCard(
        margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    bookTitle,
                    style: TextStyle(fontWeight: FontWeight.w300),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              // Text(k
              //   'Markus Nix   ',
              //   style: TextStyle(fontWeight: FontWeight.w200),
              // ),
            ],
          ),
        ),
        gradient: gradients[randomNumber],
        shadowColor: Gradients.hotLinear.colors.last.withOpacity(0.30),
        elevation: 0,
      ),
    );
  }
}
