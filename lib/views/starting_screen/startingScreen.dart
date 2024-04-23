import 'package:carousel_slider/carousel_slider.dart';
import 'package:edu_admit/views/splash_screen/splash_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'onboarding_controller.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({Key? key});

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    SplashServices _splashServices = SplashServices();

    @override
    void initState() {
      _splashServices.isLogin(context);
      super.initState();
    }

    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;
    final controller = Get.put(OnBoardingController());

    final List<String> titles = [
      'Empowering Dreams,\n Enabling Futures.',
      'Scholarships Unveiled, Community Thrived',
      'Where Aspirations Meet Opportunities',
      'Unlock Your Academic Potential',
    ];

    final List<String> descriptions = [
      'Explore Universities, Discover Scholarships, and Join a Supportive Community with EduAdmit.',
      'Your Gateway to Educational Excellence Starts Here with EduAdmit.',
      'Apply Smart, Win Scholarships, and Connect with a Community that Supports Your Educational Journey.',
      'EduAdmit is your partner in University Admissions, Scholarships, and Building a Supportive Network.',
    ];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/bg-image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: height * 0.2,
                    width: width * 0.3,
                    child: Image(
                      image: AssetImage(
                        'assets/icons/eduadmitlogo.png',
                      ),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  child: Container(
                    height: height * 0.25, // Adjust the height as needed
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        CarouselSlider.builder(
                          itemCount: titles.length,
                          itemBuilder: (context, index, realIndex) {
                            // debugPrint(index.toString());
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Center(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        titles[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Flexible(
                                    child: Text(
                                      descriptions[index],
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          options: CarouselOptions(
                            enableInfiniteScroll: false,
                            viewportFraction: 1.0,
                            height: height * 0.2,
                            onPageChanged: (index, reason) {
                              controller.updatePageIndicator(index);
                              //controller.nextPage();
                            },
                          ),
                        ),

                        Flexible(
                          child: Obx(
                            () => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (int i = 0; i < titles.length; i++)
                                  TCircularContainer(
                                    width:
                                        controller.carouselCurrentIndex.value ==
                                                i
                                            ? 60
                                            : 20,
                                    height: 6,
                                    margin: const EdgeInsets.only(right: 10),
                                    backgroundColor:
                                        controller.carouselCurrentIndex.value ==
                                                i
                                            ? Color.fromRGBO(255, 46, 0, 1)
                                            : Colors.grey,
                                  ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20), // Add space at the bottom
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.margin,
    this.backgroundColor = Colors.white,
  });
  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: backgroundColor),
      child: child,
    );
  }
}
