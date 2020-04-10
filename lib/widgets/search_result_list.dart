import 'package:flutter/material.dart';
import '../services/json_parser.dart';
import '../widgets/search_result_card.dart';


class SearchResultList extends StatelessWidget {
  SearchResultList({@required this.bookData, this.onCardTap, this.searchString});

  final List<Book> bookData;
  final Function onCardTap;
  final String searchString;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: bookData.length,
        itemBuilder: (context, index) {
          return SearchResultCard(
            title: bookData[index].book.title,
            authors: bookData[index].authorS.toString(),
            publisher: bookData[index].publisher,
            pages: bookData[index].pages,
            year: bookData[index].year,
            size: bookData[index].size,
            filetype: bookData[index].filetype,
            searchString: searchString,
          );
        });
  }
}
