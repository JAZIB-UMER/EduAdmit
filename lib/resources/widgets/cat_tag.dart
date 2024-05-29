import 'package:edu_admit/view_model/providers/bookData.dart';
import 'package:edu_admit/views/library/result_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class CatTag extends StatelessWidget {
  final Color color;
  final String tag;
  final String url;
  const CatTag(
      {Key? key, required this.color, required this.tag, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bData = Provider.of<BookData>(context, listen: false);
    return GestureDetector(
      onTap: () {
        bData.clearSearch();
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ResultList(query: url)));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: color,
        shadowColor: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          child: Text(
            maxLines: 1,
            textWidthBasis: TextWidthBasis.longestLine,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            '$tag',
            style: TextStyle(
                //  softWrap: false,
                // overflow: TextOverflow.ellipsis,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12),
          ),
        ),
        elevation: 20.0,
      ),
    );
  }
}
