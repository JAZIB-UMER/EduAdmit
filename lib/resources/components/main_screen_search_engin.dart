import 'package:flutter/material.dart';

class SearchEngin extends StatelessWidget {
  final String title;
  const SearchEngin({super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: SizedBox(
        height: height * 0.09, width: width * 0.73,
        child: TextFormField(
          style: Theme.of(context)
              .textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold,color:const Color(0xffB3B3B3) ),
          decoration:  InputDecoration(
              hintText: title,
              hintStyle: const TextStyle(fontSize: 15),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffD8D8D8)),
                  borderRadius: BorderRadius.circular(16)
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xffD8D8D8)),
                  borderRadius: BorderRadius.circular(16)
              )
          ),
        ),
      ),
    );

  }
}
