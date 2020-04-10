import 'package:flutter/material.dart';
import 'package:genesis_reader/screens/results_screen.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String searchString = '';
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: TextField(
                  controller: TextEditingController()..text = searchString,
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
                  onChanged: (value) {
                    searchString = value;
                  }),
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
                  onPressed: () {
                    if (searchString != '') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultsScreen(
                                  searchString: searchString,
                                )),
                      );
                    }
                  }),
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
      ],
    );
  }
}
