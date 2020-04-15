import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
// import 'package:epub/epub.dart';
import 'package:open_file/open_file.dart';

class DownloadedBookCard extends StatelessWidget {
  DownloadedBookCard({this.bookTitle, this.path});

  final String bookTitle;
  final String path;

  final List<LinearGradient> gradients = [
    Gradients.deepSpace,
    Gradients.tameer,
    Gradients.taitanum,
    Gradients.rainbowBlue,
    Gradients.hotLinear,
  ];

  final int randomNumber = Random().nextInt(5);

  // EpubBook book;

  // void getEbook() async {
  //   var file = File(
  //       '/sdcard/Genesis Reader/Coaching Clues Real Stories Powerful Solutions Practical Tools.epub');
  //   List<int> bytes = await file.readAsBytes();
  //   book = await EpubReader.readBook(bytes);
  // }

  @override
  Widget build(BuildContext context) {
    // print(randomNumber);
    return InkWell(
      onTap: () {
        OpenFile.open(path, type: "application/pdf" );
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
