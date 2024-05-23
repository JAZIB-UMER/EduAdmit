import 'package:edu_admit/data_model/universities_model.dart';
import 'package:edu_admit/resources/components/button.dart';
import 'package:edu_admit/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Admission admission = Get.arguments;

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
                      child: Image.network(
                        admission.bgImage,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
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
                          child: const CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.arrow_back),
                          ),
                        ),
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: Image.asset(
                            'assets/icons/eduadmitlogo.png',
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Hero(
                      tag: admission.name,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.grey)),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(admission.logo),
                          radius: width * 0.15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //---------------
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                textAlign: TextAlign.center,
                admission.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                textAlign: TextAlign.center,
                admission.location,
                style: const TextStyle(fontSize: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Admissions are ${admission.admission == true ? 'open' : 'closed'} now',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: admission.admission == true
                        ? Colors.green
                        : Colors.red),
              ),
            ),
            //-----------------------
            const TabBar(
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
                    'Contact',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ]),

            Expanded(
              child: TabBarView(children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'About Us',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        Text(admission.description),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Reffer to the link below',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () => launchUrl(Uri.parse(
                                admission.scholarshipsLink.toString())),
                            child: Text(
                              admission.scholarshipsLink,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ListTile(
                          title: const Text(
                            'Phone',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          leading: const Icon(Icons.phone_in_talk),
                          trailing: Text(admission.phoneNo),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ListTile(
                          title: const Text(
                            'Email',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          leading: const Icon(Icons.email_outlined),
                          trailing: Text(
                            admission.email,
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),

            //---------------
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Button(
                    height: height * 0.06,
                    title: 'Apply now',
                    radius: 4,
                    onPress: () async {
                      await launchUrl(Uri.parse(admission.link));
                    },
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
                        color: appThemeColor,
                      ),
                      child: const Center(
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
