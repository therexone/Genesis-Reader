import 'dart:io';
// import 'package:epub_kitty/epub_kitty.dart';
import 'package:path/path.dart' as p;
import 'package:flutter/material.dart';
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

  final RegExp re = RegExp(r'(?<=Reader\/)(.*)(?=\.epub)');

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
    bookPaths = booksDir.listSync(recursive: true).map((file){
      // if(p.extension(file.path) == '.epub')
      return file.path;
    }).toList();
    booksDir.watch(events: FileSystemEvent.all).listen((event) {
      print(event.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(bookPaths);
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
                  bookTitle: re.firstMatch(bookPaths[index]).group(0)),
            )
          : NoBooks(),
    );
  }
}

class NoBooks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Center(
              child: Opacity(
            child: Image.asset(
              'assets/images/404.png',
            ),
            opacity: 0.2,
          )),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'No Books found.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text('Downloaded Books (.epub) will appear here',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54)),
            ],
          )),
        ],
      ),
    );
  }
}

//  Widget build(BuildContext context) {
// void getBookPaths() {
//     booksDir.exists().then((isThere) {
//       if (isThere) {
//         isDirectoryExistent = true;
//         var paths = booksDir
//             .listSync()
//             .where((element) => p.extension(element.path) == '.epub')
//             .toList();
//         paths.forEach((element) {
//           if (!bookPaths.contains(element.path)) {
//             bookPaths.add(element.path);
//           }
//         });

//       }
//     });
//   }
