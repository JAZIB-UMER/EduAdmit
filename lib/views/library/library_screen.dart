import 'package:edu_admit/resources/widgets/book_tile.dart';
import 'package:edu_admit/resources/widgets/cat_tag.dart';

import 'package:edu_admit/resources/widgets/search_bar.dart';
import 'package:edu_admit/view_model/providers/bookData.dart';
import 'package:edu_admit/views/library/result_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final booksData = Provider.of<BookData>(context);
    final trendingBooks = booksData.trending;
    final novels = booksData.novels;
    final fantasy = booksData.fantasy;
    final adventure = booksData.adventure;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          ),
          const SearchBarWidget(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
            child: Text(
              'Popular Genres',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CatTag(
                color: Colors.red,
                tag: '📖 Novel',
                url: 'Novel',
              ),
              CatTag(
                color: Colors.blue,
                tag: '⚡ Self-Help',
                url: 'Self-Help',
              ),
              CatTag(
                color: Colors.green,
                tag: '🔮  Fantasy',
                url: 'Fantasy',
              )
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CatTag(
                color: Colors.teal,
                tag: '🔪  True Crime',
                url: 'True Crime',
              ),
              CatTag(
                color: Colors.pink,
                tag: '🔬 Science Fiction Fantasy',
                url: 'Science Fiction Fantasy',
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, bottom: 10, left: 16),
            child: Text(
              'Trending now',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.36,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: trendingBooks.length,
                itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                      value: trendingBooks[index],
                      child: BookTile(
                        book: trendingBooks[index],
                      ),
                    )),
          ),
          const Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 10, left: 16),
            child: Text(
              'Adventure',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.36,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: adventure.length,
                itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                      value: adventure[index],
                      child: BookTile(
                        book: adventure[index],
                      ),
                    )),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 10, left: 16),
            child: Text(
              'Novel',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.36,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: novels.length,
                itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                      value: novels[index],
                      child: BookTile(
                        book: novels[index],
                      ),
                    )),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 5.0, bottom: 10, left: 16),
            child: Text(
              'Fantasy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.36,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: fantasy.length,
                itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                      value: fantasy[index],
                      child: BookTile(
                        book: fantasy[index],
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
