import 'package:flutter/foundation.dart';
import '../models/json_parser.dart';
import 'package:http/http.dart' as http;
import '../models/book_json_parser.dart';

const apiURL = 'http://192.168.43.58:5000';

class DataFetcher {

  DataFetcher({ @required this.query });

  final String query;
  Parser parsedData;
  BookParser bookData;
  
  Future booksData() async {
    String url = '$apiURL/$query';
    var response = await http.get(url);
    if(response.statusCode == 200){
      parsedData = Parser.fromRawJson(response.body);
      return parsedData.books;
    }
    else {
      print(response.statusCode);
    }
  }
  Future book(bookTitle) async {
    String url = '$apiURL/$query/$bookTitle';
    var response = await http.get(url);
    if(response.statusCode == 200){
      bookData = BookParser.fromRawJson(response.body);
      return bookData;
    }
    else {
      print(response.statusCode);
    }
  }


}