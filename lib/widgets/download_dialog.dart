import 'dart:io';
import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:file_utils/file_utils.dart';
import 'package:flutter/material.dart';
import 'package:genesis_reader/services/api_handler.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../constants.dart';

class DownloadDialog extends StatefulWidget {
  final String title;
  final String authors;
  final String publisher;
  final String pages;
  final String size;
  final String year;
  final String filetype;
  final String searchString;

  DownloadDialog(this.title, this.authors, this.publisher, this.pages,
      this.size, this.filetype, this.year, this.searchString);

  @override
  _DownloadDialogState createState() => _DownloadDialogState();
}

class _DownloadDialogState extends State<DownloadDialog> {
  final AsyncMemoizer _memoizer = AsyncMemoizer();

  bool downloading = false;
  var progress = "Download";
  double progressValue = 0.0;
  var path = "No Data";
  Directory externalDir;
  var status = Permission.storage.status;
  bool isDisabled = false;

  Future<void> downloadFile(url) async {
    Dio dio = Dio();
    if (await status.isUndetermined || await status.isDenied) {
      await Permission.storage.request();
    }
    if (await Permission.storage.request().isGranted) {
      String dirloc = "";
      if (Platform.isAndroid) {
        dirloc = "/sdcard/Genesis Reader/";
      } else {
        dirloc = (await getApplicationDocumentsDirectory()).path;
      }
      try {
        FileUtils.mkdir([dirloc]);
        await dio.download(url, '$dirloc${widget.title}.${widget.filetype}',
            onReceiveProgress: (receivedBytes, totalBytes) {
          setState(() {
            progress =
                ((receivedBytes / totalBytes) * 100).toStringAsFixed(0) + "%";
            progressValue = receivedBytes / totalBytes;
          });
        });
      } catch (e) {
        print(e);
      }
      setState(() {
        downloading = false;
        progress = "Download Completed.";
        path = '$dirloc${widget.title}.${widget.filetype}';
        isDisabled = true;
      });
    } else {
      progress = "Permission Denied!";
    }
  }

  Future getDownloadLink() async {
    return this._memoizer.runOnce(() async {
      var bookDl =
          await DataFetcher(query: widget.searchString).bookDl(widget.title);
      return bookDl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(backgroundColor: Color(0x00fff), children: <Widget>[
      Container(
        padding:
            EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 15.0),
        decoration: BoxDecoration(
            color: Color(0xff232931),
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              widget.title,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.0),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10.0,
            ),
            Wrap(
              alignment: WrapAlignment.start,
              children: <Widget>[
                Text('Author(s) : ', style: kDetailTextStyle),
                Text(widget.authors,
                    style: TextStyle(fontSize: 12.0, color: Colors.white))
              ],
            ),
            Wrap(
              alignment: WrapAlignment.start,
              children: <Widget>[
                Text('Publisher : ', style: kDetailTextStyle),
                Text(widget.publisher,
                    style: TextStyle(fontSize: 12.0, color: Colors.white))
              ],
            ),
            Row(
              children: <Widget>[
                Text('Pages : ', style: kDetailTextStyle),
                Text(widget.pages,
                    style: TextStyle(fontSize: 12.0, color: Colors.white))
              ],
            ),
            Row(
              children: <Widget>[
                Text('Year : ', style: kDetailTextStyle),
                Text(widget.year,
                    style: TextStyle(fontSize: 12.0, color: Colors.white))
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  'Size : ',
                  style: kDetailTextStyle,
                ),
                Text(widget.size,
                    style: TextStyle(fontSize: 12.0, color: Colors.white))
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  'Extension : ',
                  style: kDetailTextStyle,
                ),
                Text(
                  widget.filetype,
                  style: TextStyle(fontSize: 12.0, color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
                future: getDownloadLink(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      onPressed: isDisabled
                          ? null
                          : () {
                              setState(() {
                                downloading = true;
                              });
                              downloadFile(snapshot.data);
                            },
                      child: downloading
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Text(
                                  'Downloading..',
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w100,
                                      color: Colors.white38),
                                  textAlign: TextAlign.end,
                                ),
                                LinearProgressIndicator(
                                  semanticsLabel: progress,
                                  value: progressValue,
                                ),
                              ],
                            )
                          : Text(progress),
                      color: downloading ? Color(0x00fff) : Color(0xffFF7060),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error finding download link');
                  }
                  return Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: GradientProgressIndicator(
                      gradient: Gradients.rainbowBlue,
                    ),
                  ));
                }),
          ],
        ),
      ),
    ]);
  }
}
