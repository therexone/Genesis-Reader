import 'package:meta/meta.dart';
import 'dart:convert';

class Parser {
    List<Book> books;

    Parser({
        @required this.books,
    });

    factory Parser.fromRawJson(String str) => Parser.fromJson(json.decode(str));

    factory Parser.fromJson(Map<String, dynamic> json) => Parser(
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
    );

}

class Book {
    List<String> authorS;
    BookClass book;
    String filetype;
    String language;
    String pages;
    String publisher;
    String size;
    String year;

    Book({
        @required this.authorS,
        @required this.book,
        @required this.filetype,
        @required this.language,
        @required this.pages,
        @required this.publisher,
        @required this.size,
        @required this.year,
    });

    factory Book.fromRawJson(String str) => Book.fromJson(json.decode(str));

    factory Book.fromJson(Map<String, dynamic> json) => Book(
        authorS: List<String>.from(json["Author(s)"].map((x) => x)),
        book: BookClass.fromJson(json["Book"]),
        filetype: json["Extension"],
        language: json["Language"],
        pages: json["Pages"],
        publisher: json["Publisher"],
        size: json["Size"],
        year: json["Year"],
    );

}

class BookClass {
    String link;
    String title;

    BookClass({
        @required this.link,
        @required this.title,
    });

    factory BookClass.fromRawJson(String str) => BookClass.fromJson(json.decode(str));

    factory BookClass.fromJson(Map<String, dynamic> json) => BookClass(
        link: json["link"],
        title: json["title"],
    );

}

