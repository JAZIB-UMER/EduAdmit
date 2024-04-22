import 'package:edu_admit/resources/components/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic height = MediaQuery.of(context).size.height;
    dynamic width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: SizedBox(
                    width: double.infinity,
                    height: height * 0.3,
                    child: const Image(
                      image: AssetImage('assets/icons/bg-image.png'),
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                top: 200,
                left: 130,
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.grey)),
                  child: Center(child: Text('Iconns')),
                ),
              ),
            ],
          ),
          //---------------
          Text(
            'University Name',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            'University Location',
            style: TextStyle(fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Registrations are open now',
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),
            ),
          ),
          //-----------------------
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Scholarship'),
                Text('How to Apply'),
              ],
            ),
            //----------------
          ),
          Divider(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'About Us',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  Text(
                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its 'Content here, content here', making it look like readable English. Many desktop publishing  many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
                ],
              ),
            ),
          )),
          //---------------
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Button(
              height: height * 0.06,
              title: 'Apply now',
              radius: 10,
              onPress: () {},
              width: width * 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
