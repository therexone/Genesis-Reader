import 'dart:io';
// import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
import 'package:genesis_reader/widgets/no_books.dart';
import 'package:genesis_reader/widgets/search_bar.dart';
import '../widgets/downloaded_book_card.dart';
import '../widgets/base_scaffold.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final booksDir = Directory('/sdcard/Genesis Reader');
  bool isDirectoryExistent = false;
  List bookPaths = [];

  final RegExp re = RegExp(r'(?<=Reader\/)(.*)(?=\.)');

  @override
  void initState() {
    super.initState();
    booksDir.exists().then((isThere) {
      if (isThere) {
        setState(() {
          isDirectoryExistent = true;
        });
        getFilePaths();
      }
    });
    // EpubKitty.setConfig("book", "#232931", "vertical", true);
  }

  void getFilePaths() {
    bookPaths = booksDir.listSync(recursive: true).map((file) {
      // if(p.extension(file.path) == '.epub')
      return file.path;
    }).toList();
    // booksDir.watch(events: FileSystemEvent.all).listen((event) {
    //   print(event.path);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      subHeading: 'Downloaded Books',
      searchWidget: SearchBar(),
      mainWidget: isDirectoryExistent
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.5),
              ),
              itemCount: bookPaths.length,
              itemBuilder: (context, index) => DownloadedBookCard(
                bookTitle: re.firstMatch(bookPaths[index]).group(0),
                path: bookPaths[index],
              ),
            )
          : NoBooks(helpText: 'Downloaded Books will appear here.',),
    );
  }
}

