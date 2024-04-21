import 'package:edu_admit/resources/components/button.dart';
import 'package:edu_admit/resources/components/image_container.dart';
import 'package:edu_admit/resources/components/main_container.dart';
import 'package:edu_admit/resources/components/main_screen_search_engin.dart';
import 'package:edu_admit/resources/components/name_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height* 0.16,
            width: width * 0.95,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset('assets/icons/edu_logo.png'),
                ),
                    Button(height: 30, width: 50, radius: 0, title: 'ADS', onPress: (){}),
              ],
            ),
          ),
         SizedBox(
           height: height* 0.04,
           width: width * 0.9,
           child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
             Text("Hey,", style: Theme.of(context)
               .textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold,color: const Color(0xffF43C3E)),),

               Text(" Abdul Basit", style: Theme.of(context)
               .textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),),

             ],
           ),
         ),
          SizedBox(
              height: height* 0.04,
            width: width * 0.9,
            child: const NameContainer(
              height: 31,
              width: 127,
              radius: 2,
              title: "Student Account",
              colors: Colors.white,
            textcolors:  Color(0xffB3B3B3),
            )),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SearchEngin(title: "Search for an institute."),
          ImageContainer(height: 58, width: 52, radius: 15, image: 'assets/icons/vector1.png', onPress: (){})
            ],
          ),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NameContainer(height: 29, width: 41, radius: 3, title: 'All', colors: Color(0xffF43C3E), textcolors:  Colors.white,),
              NameContainer(height: 29, width: 111, radius: 3, title: 'Top University', colors: Color(0xffEBEBEB), textcolors:  Color(0xff656565),),
              NameContainer(height: 29, width: 140, radius: 3, title: 'International Uni..', colors: Color(0xffEBEBEB),textcolors: Color(0xff656565),),
            ],
          ),

          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                MainContainer(
                    height: 90,
                    width: 350,
                    radius: 6,
                    image: "assets/icons/gik.png",
                    title: "Ghulam Ishaq Khan",
                    subtitle: "Topi, Khyber Pukhtunkhwa",
                    onPress: (){}),
                MainContainer(
                    height: 90,
                    width: 350,
                    radius: 6,
                    image: "assets/icons/paf.png",
                    title: "Pak Austria Fachhochschule ",
                    subtitle: "Mang, Haripur",
                    onPress: (){}),
                MainContainer(
                    height: 90,
                    width: 350,
                    radius: 6,
                    image: "assets/icons/malakand.png",
                    title: "University of Malakand",
                    subtitle: "Chakdara, Khyber Pakhtunkhwa",
                    onPress: (){}),
                MainContainer(
                    height: 90,
                    width: 350,
                    radius: 6,
                    image: "assets/icons/hazara.png",
                    title: "Hazara University",
                    subtitle: "Mansehra, Khyber Pakhtunkhwa",
                    onPress: (){}),
                MainContainer(
                    height: 90,
                    width: 350,
                    radius: 6,
                    image: "assets/icons/abdulwalikhan.png",
                    title: "Abdul Wali Khan University",
                    subtitle: "Mardan, Khyber Pakhtunkhwa",
                    onPress: (){}),
                MainContainer(
                    height: 90,
                    width: 350,
                    radius: 6,
                    image: "assets/icons/qurtuba.png",
                    title: "Qurtuba University",
                    subtitle: "Peshawar, Khyber Pakhtunkhwa",
                    onPress: (){}),
                MainContainer(
                    height: 90,
                    width: 350,
                    radius: 6,
                    image: "assets/icons/icu.png",
                    title: "Islamia College University",
                    subtitle: "Peshawar, Khyber Pakhtunkhwa",
                    onPress: (){}),
                MainContainer(
                    height: 90,
                    width: 350,
                    radius: 6,
                    image: "assets/icons/swat.png",
                    title: "University of Swat",
                    subtitle: "Swat, Khyber Pakhtunkhwa",
                    onPress: (){}),
                MainContainer(
                    height: 90,
                    width: 350,
                    radius: 6,
                    image: "assets/icons/iqra.png",
                    title: "Iqra National University",
                    subtitle: "Peshawar, Khyber Pakhtunkhwa",
                    onPress: (){}),
                MainContainer(
                    height: 90,
                    width: 350,
                    radius: 6,
                    image: "assets/icons/gik.png",
                    title: "Preston University",
                    subtitle: "Peshawar, Khyber Pakhtunkhwa",
                    onPress: (){}),

              ],
            ),
          )


        ],
      ),
    );
  }
}
