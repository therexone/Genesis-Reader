import 'package:flutter/material.dart';
import '../constants.dart';
import 'download_dialog.dart';

class SearchResultCard extends StatelessWidget {
  SearchResultCard(
      {this.title,
      this.authors,
      this.publisher,
      this.pages,
      this.year,
      this.filetype,
      this.size,
      this.searchString
      });

  final String title;
  final String authors;
  final String publisher;
  final String pages;
  final String year;
  final String filetype;
  final String size;
  final String searchString;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        showDialog(context: context, builder: (context) {
          return DownloadDialog(title, authors, publisher, pages, size, filetype, year, searchString);
        },);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Color(0xff232931),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15.0),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      authors,
                      style: kDetailTextStyle,
                    ),
                    Wrap(
                      alignment: WrapAlignment.start,
                      children: <Widget>[
                        Text('Publisher : ', style: kDetailTextStyle),
                        Text(publisher, style: kDetailTextStyle)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Pages : ', style: kDetailTextStyle),
                        Text(pages, style: kDetailTextStyle)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text('Year : ', style: kDetailTextStyle),
                        Text(year, style: kDetailTextStyle)
                      ],
                    ),
                  ]),
            ),
            Expanded(
              flex: 1,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.file_download),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(size, style: kDetailTextStyle),
                  Row(
                    children: <Widget>[
                      Text(
                        'Extension :',
                        style: kDetailTextStyle,
                      ),
                      Text(filetype, style: kDetailTextStyle)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
