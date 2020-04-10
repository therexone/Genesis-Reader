import 'package:flutter/foundation.dart';
import 'json_parser.dart';
import 'package:http/http.dart' as http;
import 'book_json_parser.dart';

const apiURL = 'http://192.168.43.58:5000';

class DataFetcher {
  DataFetcher({@required this.query});

  final String query;
  Parser parsedData;
  BookParser bookData;

  Future booksData() async {
    String url = '$apiURL/$query';
    var response;
    try {
      response = await http.get(url);
    } catch (SocketException) {
      print(SocketException);
    }

    if (response.statusCode == 200) {
      parsedData = Parser.fromRawJson(response.body);
      return parsedData.books;
    } else {
      print(response.statusCode);
    }
  }

  Future bookDl(bookTitle) async {
    String url = '$apiURL/$query/$bookTitle';
    var response;
    try {
      response = await http.get(url);
    } catch (SocketException) {
      print(SocketException);
    }

    if (response.statusCode == 200) {
      bookData = BookParser.fromRawJson(response.body);
      return bookData.download;
    } else {
      print(response.statusCode);
    }
  }
}
