import 'package:edu_admit/resources/components/button.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: height * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: height * 0.05,
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
                  //-------------
                  const SizedBox(
                      child: Image(
                          image: AssetImage(
                    'assets/icons/eduadmitlogo.png',
                  ))),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            //------------
            Text(
              textAlign: TextAlign.start,
              "Buy Your Plans",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              textAlign: TextAlign.center,
              "You will be charged once payment is verified",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: const Color(0xffB3B3B3), fontWeight: FontWeight.w400),
            ),
            //----------------------------------------------
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 15),
                          height: height * 0.3,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(16)),
                          child: const Column(
                            children: [
                              ReuseableRow(
                                  title: 'Application Links',
                                  textColor: Colors.black,
                                  iconColor: Color(0xffFF6666)),
                              ReuseableRow(
                                  title: 'Tutorial & guide',
                                  textColor: Colors.black,
                                  iconColor: Color(0xffFF6666)),
                              ReuseableRow(
                                  title: 'Forget Password',
                                  textColor: Colors.black,
                                  iconColor: Color(0xffFF6666)),
                              ReuseableRow(
                                  title: 'Filter Selection',
                                  textColor: Colors.black,
                                  iconColor: Color(0xffFF6666)),
                              ReuseableRow(
                                  title: 'Updated Forms',
                                  textColor: Colors.black,
                                  iconColor: Color(0xffFF6666)),
                              ReuseableRow(
                                  title: 'Bookmark',
                                  textColor: Colors.black,
                                  iconColor: Color(0xffFF6666)),
                              ReuseableRow(
                                  title: 'App Notifications',
                                  textColor: Colors.black,
                                  iconColor: Color(0xffFF6666)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "Free Version",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: const Color(0xff636363),
                                  fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 15),
                          height: height * 0.5,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [
                                Color(0xff1400FF),
                                Color(0xffFF00F5),
                              ]),
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(16)),
                          child: const Column(
                            children: [
                              ReuseableRow(
                                  title: 'Application Links',
                                  textColor: Colors.white,
                                  iconColor: Colors.white),
                              ReuseableRow(
                                  title: 'Tutorial & guide',
                                  textColor: Colors.white,
                                  iconColor: Colors.white),
                              ReuseableRow(
                                  title: 'Forget Password',
                                  textColor: Colors.white,
                                  iconColor: Colors.white),
                              ReuseableRow(
                                  title: 'Filter Selection',
                                  textColor: Colors.white,
                                  iconColor: Colors.white),
                              ReuseableRow(
                                  title: 'Updated Forms',
                                  textColor: Colors.white,
                                  iconColor: Colors.white),
                              ReuseableRow(
                                  title: 'Bookmark',
                                  textColor: Colors.white,
                                  iconColor: Colors.white),
                              ReuseableRow(
                                  title: 'App Notifications',
                                  textColor: Colors.white,
                                  iconColor: Colors.white),
                              ReuseableRow(
                                  title: 'Discounted bundles',
                                  textColor: Colors.white,
                                  iconColor: Colors.white),
                              ReuseableRow(
                                  title: 'Forget Password',
                                  textColor: Colors.white,
                                  iconColor: Colors.white),
                              ReuseableRow(
                                  title: 'No Ads',
                                  textColor: Colors.white,
                                  iconColor: Colors.white),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          "Premium Version",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: const Color(0xff636363),
                                  fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            //-------------------
            Align(
              alignment: Alignment.bottomCenter,
              child: Button(
                  height: height * 0.07,
                  width: double.infinity,
                  radius: 16,
                  title: 'Proceed To Checkout',
                  onPress: () {},
                  loading: false),
            )
          ],
        ),
      ),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  final String title;
  final Color textColor;
  final Color iconColor;
  const ReuseableRow({
    super.key,
    required this.title,
    required this.textColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              textAlign: TextAlign.start,
              '- $title',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w500, color: textColor),
            ),
          ),
          Icon(
            Icons.verified,
            size: 15,
            color: iconColor,
          )
        ],
      ),
    );
  }
}
