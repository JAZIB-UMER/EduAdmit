import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_admit/data_model/universities_model.dart';
import 'package:edu_admit/utils/colors.dart';

import 'package:edu_admit/views/uni_data/uni_data_update/update_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UniversityDataUpdateScreen extends StatelessWidget {
  const UniversityDataUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: appThemeColor,
        title: Text(
          'Set Admission',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('Universities').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.error is SocketException) {
              return const Center(child: Text('Error: No Internet'));
            } else {
              List<Admission> admissions = snapshot.data!.docs.map((doc) {
                return Admission.fromJson(doc.data() as Map<String, dynamic>);
              }).toList();

              return ListView.builder(
                itemCount: admissions.length,
                itemBuilder: (context, index) {
                  return UpdateContainer(
                    image: admissions[index].logo,
                    title: admissions[index].name,
                    subtitle: admissions[index].location,
                    admissionOpen: admissions[index].admission,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
