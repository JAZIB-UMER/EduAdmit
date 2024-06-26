import 'dart:ui';
import 'package:edu_admit/data_model/book.dart';
import 'package:edu_admit/resources/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:readmore/readmore.dart';

import 'package:url_launcher/url_launcher.dart';

class BookDetailsPage extends StatelessWidget {
  final Book book;
  Future<void> _launchURL({required String url}) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      Fluttertoast.showToast(msg: 'Failed to load');
    }
  }

  const BookDetailsPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.465,
                  child: Stack(
                    children: <Widget>[
                      Image.network(
                        book.thumbnailUrl.toString(),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Positioned.fill(
                          child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                              child: Container()))
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            book.title.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 14.0),
                            child: Text(book.author.toString()),
                          ),
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 10.0),
                                child: SizedBox(width: 44, child: Rating()),
                              ),
                              Text("(52 Ratings)")
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              "Description",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          ReadMoreText(
                            book.description.toString(),
                            trimLines: 2,
                            colorClickableText: Colors.red,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: ' Read more',
                            trimExpandedText: ' Show less',
                            moreStyle: const TextStyle(
                                overflow: TextOverflow.fade,
                                color: Colors.blue,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2)
                        ],
                      ),
                    ),
                    // width: double.infinity,
                    // height: MediaQuery.of(context).size.height * 0.5,
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: FloatingActionButton(
                backgroundColor: const Color(0xffFF415D),
                onPressed: () {},
                child: const Icon(
                  Icons.favorite_rounded,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.14),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          book.thumbnailUrl.toString(),
                        ),
                        fit: BoxFit.cover),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32)),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(115, 117, 117, 117),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(115, 117, 117, 117),
                    child: IconButton(
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ))),
                  onPressed: () {
                    _launchURL(url: book.previewLink.toString());
                  },
                  child: const Padding(
                      padding: EdgeInsets.all(18),
                      child: Text('Start reading')),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
