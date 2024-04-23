import 'package:edu_admit/resources/components/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: height * 0.4,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: SizedBox(
                        width: double.infinity,
                        height: height * 0.4,
                        child: const Image(
                          image: AssetImage(
                            'assets/icons/paf_bg.png',
                          ),
                          fit: BoxFit.fitHeight,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: Image.asset(
                            'assets/icons/eduadmitlogo.png',
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       vertical: 40, horizontal: 10),
                  //   child: Align(
                  //     alignment: Alignment.topLeft,
                  //     child: InkWell(
                  //       onTap: () {
                  //         Get.back();
                  //       },
                  //       child: CircleAvatar(
                  //         backgroundColor: Colors.white,
                  //         child: Icon(Icons.arrow_back),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.grey)),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage('assets/icons/paf_logo.png'),
                        radius: width * 0.15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //---------------
            SizedBox(
              height: 2,
            ),
            Text(
              'Pak Austria Fachhocschule',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              'Mang, Haripur',
              style: TextStyle(fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Registrations are open now',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            //-----------------------
            TabBar(
                labelColor: Colors.black,
                padding: EdgeInsets.all(5),
                indicatorColor: Colors.black,
                tabs: [
                  Text(
                    'Description',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  Text(
                    'Scholarships',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    'How to apply',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ]),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Text(
            //         'Description',
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //         ),
            //       ),
            //       Text('Scholarship'),
            //       Text('How to Apply'),
            //     ],
            //   ),
            //   //----------------
            // ),

            Expanded(
              child: TabBarView(children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'About Us',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        Text(
                            "Pak-Austria Fachhochschule: Institute of Applied Sciences and Technology is located in a rapidly changing and fiercely competitive global environment, Pakistan has to make bold strategic choices in order to achieve sustainable growth in the manufacturing sector.Our vision is to emerge as an outstanding leader in imparting sound skill-oriented education and producing capable, diligent, and career-ready graduates to succeed in a globally interdependent society."),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Requirements',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        Text(
                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its 'Content here, content here', making it look like readable English. Many desktop publishing  many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'About Us',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        Text(
                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its 'Content here, content here', making it look like readable English. Many desktop publishing  many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Requirements',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        Text(
                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its 'Content here, content here', making it look like readable English. Many desktop publishing  many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'About Us',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        Text(
                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its 'Content here, content here', making it look like readable English. Many desktop publishing  many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Requirements',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        Text(
                            "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its 'Content here, content here', making it look like readable English. Many desktop publishing  many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
                      ],
                    ),
                  ),
                ),
              ]),
            ),

            //---------------
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Button(
                    height: height * 0.06,
                    title: 'Apply now',
                    radius: 4,
                    onPress: () {},
                    width: width * 0.66,
                    loading: false,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: height * 0.06,
                      width: width * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: const Color(0xffF43C3E),
                      ),
                      child: Center(
                          child: Icon(
                        Icons.bookmark_border,
                        color: Colors.white,
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
