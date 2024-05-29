import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_admit/data_model/scholarships_model.dart';
import 'package:edu_admit/data_model/universities_model.dart';
import 'package:edu_admit/data_model/user_model.dart';
import 'package:edu_admit/resources/components/button.dart';
import 'package:edu_admit/resources/components/main_container.dart';
import 'package:edu_admit/resources/drawer/drawer.dart';
import 'package:connectivity/connectivity.dart';
import 'package:edu_admit/services/data_services/firestore_services.dart';
import 'package:edu_admit/services/notifications/notification_services.dart';
import 'package:edu_admit/view_model/providers/bookData.dart';
import 'package:edu_admit/views/description_screen/description_screen.dart';
import 'package:edu_admit/views/main_screens/components/components.dart';
import 'package:edu_admit/views/plans_screen/packages_screen.dart';
import 'package:edu_admit/views/scholarships_screen/scholarships_card.dart';
import 'package:edu_admit/views/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../services/auth_services/shared_pref_services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  NotificationServices notificationServices = NotificationServices();
  late UserData userData;
  bool _hasInternet = true;

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
    userData = SharedPreferencesHelper().getData();
    notificationServices.requestNotificationPermission();
    notificationServices.setupInteractMessage(context);
    notificationServices.fireBaseInit(context);
    notificationServices.getDeviceToken().then((value) {
      debugPrint('Device Token : $value');
    }).onError((error, stackTrace) {});
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var bookData = Provider.of<BookData>(context, listen: false);
      bookData.addTrending();
      bookData.addFantasy();
      bookData.addadventure();
      bookData.addnovels();
    });
    super.initState();
  }

  Future<void> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        _hasInternet = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Admission> admissions = [];
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Button(
                height: 30,
                width: 100,
                radius: 0,
                title: 'Packages',
                onPress: () => Get.to(() => const PackagesScreen()),
                loading: false,
              ),
            ),
          ],
        ),
        key: scaffoldKey,
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: Colors.white,
                    expandedHeight: 300,
                    flexibleSpace: FlexibleSpace(
                      height: height,
                      width: width,
                      userName: userData.name,
                      userLevel: userData.level,
                      onPress: () {
                        Get.to(() => SearchScreen(admissions: admissions));
                      },
                    ),

                    ///  -- Tabs
                    bottom: const TTabBar(
                      tabs: [
                        Tab(
                          child: Text(
                            ' All ',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Tab(
                          child: Text(
                            textAlign: TextAlign.start,
                            'Top Universities',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Opened Admissions',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'International Scholarships',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    )),
              ];
            },

            /// -- Body
            body: _hasInternet
                ? StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Universities')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(child: Text('Error'));
                      } else if (snapshot.error is SocketException) {
                        return const Center(
                            child: Text('No Internet Connection'));
                      } else {
                        try {
                          bool found = false;
                          admissions = snapshot.data!.docs.map((doc) {
                            return Admission.fromJson(
                                doc.data() as Map<String, dynamic>);
                          }).toList();

                          for (var admission in admissions) {
                            if (admission.admission == true) {
                              found = true;
                            }
                          }
                          return TabBarView(children: [
                            ListView.builder(
                              itemCount: admissions.length,
                              itemBuilder: (context, index) {
                                return MainContainer(
                                    image: admissions[index].logo,
                                    title: admissions[index].name,
                                    subtitle: admissions[index].location,
                                    onPress: () {
                                      Get.to(() => const DescriptionScreen(),
                                          arguments: admissions[index]);
                                    });
                              },
                            ),
                            ListView.builder(
                              itemCount: admissions.length,
                              itemBuilder: (context, index) {
                                return (admissions[index].rank <= 10 &&
                                        admissions[index].rank >= 1)
                                    ? MainContainer(
                                        image: admissions[index].logo,
                                        title: admissions[index].name,
                                        subtitle: admissions[index].location,
                                        onPress: () {
                                          Get.to(
                                              () => const DescriptionScreen(),
                                              arguments: admissions[index]);
                                        })
                                    : const SizedBox();
                              },
                            ),

                            found
                                ? ListView.builder(
                                    itemCount: admissions.length,
                                    itemBuilder: (context, index) {
                                      return admissions[index].admission
                                          ? MainContainer(
                                              image: admissions[index].logo,
                                              title: admissions[index].name,
                                              subtitle:
                                                  admissions[index].location,
                                              onPress: () {
                                                Get.to(
                                                    () =>
                                                        const DescriptionScreen(),
                                                    arguments:
                                                        admissions[index]);
                                              })
                                          : const SizedBox();
                                    })
                                : const Center(
                                    child: Text(
                                    'Admissions are Closed now ',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  )),
                            //-------------------------------

                            SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('Scholarships')
                                      .snapshots(),
                                  builder: (context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    } else if (snapshot.hasError) {
                                      return Center(
                                          child:
                                              Text('Error: ${snapshot.error}'));
                                    } else if (snapshot.data!.size
                                        .isLowerThan(1)) {
                                      return const Center(
                                          child: Text(
                                        'No Scholarships Available Now ',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      ));
                                    } else {
                                      List<Scholarship> scholarships = snapshot
                                          .data!.docs.reversed
                                          .map((doc) {
                                        return Scholarship.fromJson(
                                            doc.data() as Map<String, dynamic>);
                                      }).toList();

                                      return ListView.builder(
                                        reverse: false,
                                        itemCount: scholarships.length,
                                        itemBuilder: (context, index) {
                                          return ScholarshipCard(
                                            scholarshipName:
                                                scholarships[index].name,
                                            provider:
                                                scholarships[index].provider,
                                            deadline:
                                                scholarships[index].deadline,
                                            description:
                                                scholarships[index].description,
                                            link: scholarships[index].link,
                                            date: scholarships[index].date,
                                            userLevel:
                                                userData.level.toString(),
                                            onPress: () {
                                              FireStoreServices()
                                                  .deleteScholarship(
                                                      scholarships[index]
                                                          .scholarshipId,
                                                      context);
                                            },
                                          );
                                        },
                                      );
                                    }
                                  }),
                            ),
                          ]);
                        } catch (e) {
                          throw e.toString();
                        }
                      }
                    },
                  )
                : const Center(child: Text('No Internet Connection'))),
        drawer: CustomDrawer(
          userName: userData.name.toString(),
          userEmail: userData.email.toString(),
          userLevel: userData.level.toString(),
          internet: _hasInternet,
        ),
      ),
    );
  }
}
