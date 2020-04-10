import 'package:flutter/material.dart';
import 'package:genesis_reader/widgets/search_bar.dart';
import '../widgets/downloaded_book_card.dart';
import '../widgets/base_scaffold.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      subHeading: 'Downloaded Books',
      searchWidget: SearchBar(),
      mainWidget: DownloadedBookCard(authors: 'brh', bookTitle: 'nigga way',)
    );
  }
}
