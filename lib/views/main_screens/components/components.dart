import 'package:edu_admit/resources/components/main_screen_search_engin.dart';
import 'package:edu_admit/resources/components/name_container.dart';
import 'package:edu_admit/utils/colors.dart';

import 'package:flutter/material.dart';

class FlexibleSpace extends StatelessWidget {
  const FlexibleSpace({
    super.key,
    required this.height,
    required this.width,
    required this.userName,
    required this.userLevel,
    required this.onPress,
  });

  final VoidCallback onPress;
  final dynamic height;
  final dynamic width;
  final dynamic userName;
  final dynamic userLevel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          SizedBox(
            height: height * 0.01,
          ),
          SizedBox(
            height: height * 0.055,
            width: width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hey, ",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.bold, color: appThemeColor),
                ),
                Flexible(
                  child: Text(
                    userName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: height * 0.04,
              width: width * 0.9,
              child: NameContainer(
                height: 31,
                width: 127,
                radius: 2,
                title: userLevel == 'user' ? 'Student' : 'Admin',
                colors: Colors.transparent,
                textcolors: userLevel == 'user'
                    ? const Color(0xffB3B3B3)
                    : Colors.black,
              )),
          const SizedBox(height: 15),
          TSearchContainer(
              text: 'Search',
              showBackground: false,
              showBorder: true,
              onTap: onPress),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});

  // TO Add background Color to Tab we Have Wrapped it in [Material]

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: TabBar(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        tabAlignment: TabAlignment.center,
        isScrollable: true,
        indicator: BoxDecoration(
            color: appThemeColor, borderRadius: BorderRadius.circular(3)),
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        dividerHeight: 0,
        labelColor: Colors.white,
        tabs: tabs,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.5);
}
