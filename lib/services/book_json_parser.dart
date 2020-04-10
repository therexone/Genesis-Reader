import 'json_parser.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class BookParser extends Parser {
  Book book;
  String download;

  BookParser({
    @required this.book,
    @required this.download,
  });

  factory BookParser.fromRawJson(String str) =>
      BookParser.fromJson(json.decode(str));

  factory BookParser.fromJson(Map<String, dynamic> json) => BookParser(
        book: Book.fromJson(json["book"]),
        download: json["download"],
      );
}
