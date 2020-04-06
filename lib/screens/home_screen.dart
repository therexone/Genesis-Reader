import 'package:flutter/material.dart';
import '../components/downloaded_book_card.dart';
import '../constants.dart';

class HomeScreen extends StatelessWidget {
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
            Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(12.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                            color: Colors.white,
                            width: 10.0,
                            style: BorderStyle.solid),
                      ),
                      labelText: 'Search Books',
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: RaisedButton(
                    padding: EdgeInsets.all(6.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color(0xff00D3A9),
                    child: Icon(
                      Icons.search,
                      size: 35.0,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
              child: Divider(
                thickness: 5.0,
                color: Color(0xff272727),
              ),
            ),
            Text(
              'Downloaded Books',
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white38, fontSize: 15.0),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ListView(
                  children: <Widget>[
                    // DownloadedBookCard(
                    //   bookTitle: 'Exploring Python',
                    //   authors: 'Markus Nix',
                    // ),
                    Container(
                      padding: EdgeInsets.all(15.0),
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
                                    'Think Python',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.0),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    'Allen B. Downey, Jason lmoa',
                                    style: kDetailTextStyle,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text('Publisher : ',
                                          style: kDetailTextStyle),
                                      Text('Orielly Press',
                                          style: kDetailTextStyle)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text('Pages : ', style: kDetailTextStyle),
                                      Text('174', style: kDetailTextStyle)
                                    ],
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text('Year : ', style: kDetailTextStyle),
                                      Text('2011', style: kDetailTextStyle)
                                    ],
                                  ),
                                ]),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(Icons.file_download),
                                // SizedBox(
                                //   height: 10.0,
                                // ),
                                Text('2 Mb', style: kDetailTextStyle),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      'Extension :',
                                      style: kDetailTextStyle,
                                    ),
                                    Text('pdf', style: kDetailTextStyle)
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
