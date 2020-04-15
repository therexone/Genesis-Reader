import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:genesis_reader/services/api_handler.dart';
import 'package:genesis_reader/services/json_parser.dart';
import 'package:genesis_reader/widgets/no_books.dart';
import '../widgets/base_scaffold.dart';
import '../widgets/search_result_list.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen({this.searchString});

  final String searchString;

  final _bookListCache = AsyncCache<List<Book>>(Duration(minutes: 10));

  Future<List<Book>> getBooksList(query) => _bookListCache.fetch(() async {
        var bookList = await DataFetcher(query: query).booksData();
        return bookList;
      });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      subHeading: 'Results for "$searchString"',
      mainWidget: FutureBuilder(
        future: getBooksList(searchString),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data.isEmpty
                ? NoBooks(helpText: 'Try a different search combination',)
                : SearchResultList(
                    bookData: snapshot.data,
                    searchString: searchString,
                  );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error'),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
