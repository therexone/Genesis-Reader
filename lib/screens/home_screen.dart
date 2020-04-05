import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(15.0),
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
                    padding: EdgeInsets.all(7.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    color: Color(0xff00D3A9),
                    child: Icon(Icons.search, size: 35.0,),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          Divider(thickness: 5.0, color: Color(0xff272727),),
        ],
      ),
    );
  }
}
