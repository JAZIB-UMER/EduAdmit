import 'package:edu_admit/utils/colors.dart';
import 'package:edu_admit/view_model/upload_image.dart';
import 'package:edu_admit/views/about/about_screen.dart';
import 'package:edu_admit/views/community_screen/community_screen.dart';
import 'package:edu_admit/views/library/library_screen.dart';
import 'package:edu_admit/views/scholarships_screen/add_scholarships.dart';
import 'package:edu_admit/views/splash_screen/splash_services.dart';
import 'package:edu_admit/views/uni_data/uni_data_update/uni_data_update_screen.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../views/uni_data/uni_data_upload/uni_up_screen.dart';

class CustomDrawer extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userLevel;
  final bool internet;

  const CustomDrawer(
      {super.key,
      required this.userName,
      required this.userEmail,
      required this.userLevel,
      required this.internet});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final object = Get.put(UploadImage());

  @override
  void initState() {
    super.initState();
    // Upload Image Function
    UploadImage().getImageUrl().then((value) {
      object.newUrl!.value = value;
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final SplashServices splashServices = SplashServices();

    return Drawer(
      // backgroundColor: lightBlue,
      child: widget.internet
          ? Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [appThemeColor, Colors.redAccent],
                ),
                // color: lightBlue,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Obx(
                            () => InkWell(
                              onTap: () async {
                                await object
                                    .getImage()
                                    .onError((error, stackTrace) {});
                              },
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: object.newUrl!.value.isNotEmpty
                                    ? NetworkImage(object.newUrl!.value)
                                    : null,
                                child: object.newUrl!.value.isEmpty
                                    ? const Icon(Icons.person)
                                    : null,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    widget.userName,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    widget.userEmail,
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                            title: const Text(
                              'Home',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              // Update the UI based on the item selected
                              Navigator.pop(context); // Closes the drawer
                            },
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.info_outline,
                              color: Colors.white,
                            ),
                            title: const Text(
                              'About',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              // Update the UI based on the item selected
                              Get.to(() => const AboutScreen());
                            },
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.menu_book_sharp,
                              color: Colors.white,
                            ),
                            title: const Text(
                              'Library',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              // Update the UI based on the item selected
                              Get.to(() => const LibraryScreen());
                            },
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.people_alt_outlined,
                              color: Colors.white,
                            ),
                            title: const Text(
                              'Community',
                              style: TextStyle(color: Colors.white),
                            ),
                            onTap: () {
                              // Update the UI based on the item selected
                              // Navigator.pop(context); // Closes the drawer
                              Get.to(() => ChatScreen(
                                    userName: widget.userName,
                                  ));
                            },
                          ),
                          widget.userLevel == 'admin'
                              ? ListTile(
                                  leading: const Icon(
                                    Icons.admin_panel_settings_outlined,
                                    color: Colors.white,
                                  ),
                                  title: const Text(
                                    'Add University',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    // Update the UI based on the item selected
                                    // Navigator.pop(context); // Closes the drawer
                                    Get.to(() => const UniversityFormScreen());
                                  },
                                )
                              : const SizedBox(),
                          widget.userLevel == 'admin'
                              ? ListTile(
                                  leading: const Icon(
                                    Icons.update,
                                    color: Colors.white,
                                  ),
                                  title: const Text(
                                    'Set Admission',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    // Update the UI based on the item selected
                                    // Navigator.pop(context); // Closes the drawer
                                    Get.to(() =>
                                        const UniversityDataUpdateScreen());
                                  },
                                )
                              : const SizedBox(),
                          widget.userLevel == 'admin'
                              ? ListTile(
                                  leading: const Icon(
                                    Icons.school,
                                    color: Colors.white,
                                  ),
                                  title: const Text(
                                    'Add Scholarships',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    // Update the UI based on the item selected
                                    // Navigator.pop(context); // Closes the drawer
                                    Get.to(() => const AddScholarships());
                                  },
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                    //const Spacer(),
                    ListTile(
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'Log out',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        splashServices.logOut(context);
                        // Update the UI based on the item selected
                        // Navigator.pop(context); // Closes the drawer
                      },
                    ),
                  ],
                ),
              ),
            )
          : const Center(child: Text('No Internet Connection')),
    );
  }
}
