import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final VoidCallback onPress;
  const MainContainer({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 120,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: const Color(0xffD8D8D8), // Color of the border
              width: 0, // Width of the border
            ),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.09), offset: Offset(1, 1)),
            ],
            color: const Color(0xffF7F7F7),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                  tag: title,
                  child: SizedBox(height: 80, child: Image.network(image))),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontSize: 15, fontWeight: FontWeight.bold),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(subtitle,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff8F8F8F))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
