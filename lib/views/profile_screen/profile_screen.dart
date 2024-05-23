import 'package:edu_admit/resources/components/button.dart';
import 'package:edu_admit/utils/colors.dart';
import 'package:edu_admit/utils/utilities.dart';
import 'package:edu_admit/view_model/upload_image.dart';
import 'package:edu_admit/views/splash_screen/splash_services.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final SplashServices splashServices = SplashServices();
  @override
  Widget build(BuildContext context) {
    final object = Get.put(UploadImage());
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.red,
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                color: appThemeColor,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.06,
            right: 20,
            child: Button(
              height: 30,
              width: 80,
              radius: 0,
              title: 'Log Out',
              onPress: () {
                splashServices.logOut(context);
              },
              loading: false,
            ),
          ),
          Positioned(
            top: screenHeight * 0.05,
            left: 20,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            ),
          ),
          Positioned(
            top: screenHeight * 0.15,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Obx(() => Hero(
                      tag: 'EffectOne',
                      child: InkWell(
                        onTap: () async {
                          await object
                              .getImage()
                              .then((value) {})
                              .onError((error, stackTrace) {
                            Utils.toastMessage(error.toString());
                          });
                        },
                        child: CircleAvatar(
                          radius: screenHeight * 0.1,
                          child: object.newUrl != null
                              ? Image.network(object.newUrl.toString())
                              : const Icon(Icons.person),
                        ),
                      ),
                    )),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  'Zoha',
                  style: TextStyle(
                    fontSize: screenHeight * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Software Developer',
                  style: TextStyle(
                    fontSize: screenHeight * 0.03,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight * 0.6,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildInfoRow(
                    icon: Icons.email,
                    text: 'Zoha688@gmail.com',
                    screenWidth: screenWidth,
                  ),
                  _buildInfoRow(
                    icon: Icons.phone,
                    text: '+92-3265879802',
                    screenWidth: screenWidth,
                  ),
                  _buildInfoRow(
                    icon: Icons.person,
                    text: 'Female',
                    screenWidth: screenWidth,
                  ),
                  _buildInfoRow(
                    icon: Icons.location_city,
                    text: 'New York',
                    screenWidth: screenWidth,
                  ),
                  // Add more info rows as needed
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
      {required IconData icon,
      required String text,
      required double screenWidth}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.redAccent,
            size: screenWidth * 0.06,
          ),
          SizedBox(width: screenWidth * 0.04),
          Text(
            text,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
