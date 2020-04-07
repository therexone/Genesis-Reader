import 'package:flutter/material.dart';
import 'package:genesis_reader/models/api_handler.dart';
import 'package:genesis_reader/models/book_json_parser.dart';
import '../components/downloaded_book_card.dart';
import '../components/search_result_list.dart';
import '../models/json_parser.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Book> bookData;
  bool isLoading = true;
  String searchString = '';

  void getBookList(value) async {
    bookData = await DataFetcher(query: value).booksData();
    setState(() {
      isLoading = false;
    });
  }

  void getBook(bookTitle) async{
    bookData = await DataFetcher(query: searchString).book(bookTitle);
    setState(() {
      isLoading = false;
    });
  }

  void onSearch() {
    if (searchString != '') {
      setState(() {
        isLoading = true;
        getBookList(searchString);
      });
    }
  }

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
                    onChanged: (value) => searchString = value,
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
                      onPressed: () {
                        onSearch();
                        print(bookData);
                        FocusScope.of(context).requestFocus(new FocusNode());
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
            Text(
              '${ bookData.length == 0 ? "No " : '' }Results for "$searchString"',
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.white38, fontSize: 15.0),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: bookData == null
                    ? Center(
                        child: Text('Search to get results'),
                      )
                    : isLoading
                        ? Center(child: CircularProgressIndicator())
                        : SearchResultList(bookData: bookData, onCardTap: getBook),
              ),
            )
          ],
        ),
      ),
    );
  }
}
