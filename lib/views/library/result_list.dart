import 'package:edu_admit/resources/widgets/book_list_tile.dart';
import 'package:edu_admit/view_model/providers/bookData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ResultList extends StatefulWidget {
  final String query;
  int indexNumber = 0;
  ResultList({super.key, required this.query});

  @override
  State<ResultList> createState() => _ResultListState();
}

class _ResultListState extends State<ResultList> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var bookData = Provider.of<BookData>(context, listen: false);
      bookData.addSearchres(query: widget.query, indexNumber: 0);
    });
    // TODO: implement initState
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final booksData = Provider.of<BookData>(context);
    final searchResults = booksData.searchres;

    return Scaffold(
        body: NotificationListener<ScrollEndNotification>(
      onNotification: (scrollEnd) {
        final metrics = scrollEnd.metrics;
        if (metrics.atEdge) {
          bool isTop = metrics.pixels == 0;
          if (isTop) {
          } else {
            widget.indexNumber += 10;
            booksData.loadMore(
                query: widget.query, indexNumber: widget.indexNumber);
          }
        }
        return true;
      },
      child: ListView.builder(
          itemCount: searchResults.length + 1,
          itemBuilder: (ctx, index) {
            if (index < searchResults.length) {
              return ChangeNotifierProvider.value(
                value: searchResults[index],
                child: BookListTile(searchResults[index]),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          }),
    ));
  }
}
