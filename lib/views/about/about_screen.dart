import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Image.asset(
            'assets/icons/pafbackground.jpg',
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),
          Center(
            child: Container(
              height: height * 0.55,
              width: width * 0.85,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black45,
                        offset: Offset(8.0, 8.0),
                        blurRadius: 10,
                        blurStyle: BlurStyle.inner)
                  ]),
              child: const Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About :',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    Text(
                        textAlign: TextAlign.justify,
                        'The icon for EduAdmit Pakistan encapsulates the essence of our mission—simplifying the higher education journey for students. It features a sleek, modern design with elements representing both education and connectivity. The icon prominently displays a graduation cap, symbolizing academic achievement, and a network motif, highlighting our commitment to creating a connected, supportive community. With a vibrant color palette that conveys energy and innovation, the EduAdmit icon serves as a visual gateway to a comprehensive, user-friendly platform where students can find essential information about universities, admission deadlines, scholarships, and more, and receive all the necessary alerts.'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
