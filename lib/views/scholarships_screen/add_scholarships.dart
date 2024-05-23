import 'package:edu_admit/data_model/scholarships_model.dart';
import 'package:edu_admit/resources/components/button.dart';
import 'package:edu_admit/services/data_services/firestore_services.dart';
import 'package:edu_admit/services/notifications/notification_services.dart';
import 'package:edu_admit/utils/colors.dart';
import 'package:edu_admit/utils/utilities.dart';
import 'package:edu_admit/view_model/auth_view_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddScholarships extends StatefulWidget {
  const AddScholarships({super.key});

  @override
  State<AddScholarships> createState() => _AddScholarshipsState();
}

class _AddScholarshipsState extends State<AddScholarships> {
  final TextEditingController scholarshipNameController =
      TextEditingController();

  final TextEditingController scholarshipProviderController =
      TextEditingController();

  final TextEditingController scholarshipDeadlineController =
      TextEditingController();

  final TextEditingController scholarshipDescriptionController =
      TextEditingController();

  final TextEditingController scholarshipLinkController =
      TextEditingController();

  AuthViewModel object = Get.put(AuthViewModel());

  @override
  void dispose() {
    scholarshipNameController.dispose();
    scholarshipProviderController.dispose();
    scholarshipDeadlineController.dispose();
    scholarshipDescriptionController.dispose();
    scholarshipLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: appThemeColor,
        title: Text(
          'Add Scholarship Data',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextFormField(
                controller: scholarshipNameController,
                decoration: const InputDecoration(
                  labelText: 'Scholarship Name',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: appThemeColor)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appThemeColor),
                  ),
                ),
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextFormField(
                controller: scholarshipLinkController,
                decoration: const InputDecoration(
                  labelText: 'Scholarship Link',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: appThemeColor)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appThemeColor),
                  ),
                ),
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextFormField(
                controller: scholarshipProviderController,
                decoration: const InputDecoration(
                  labelText: 'Scholarship Provider',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: appThemeColor)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appThemeColor),
                  ),
                ),
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: scholarshipDeadlineController,
                decoration: const InputDecoration(
                  labelText: 'Deadline(xxxx-x-x)',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: appThemeColor)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appThemeColor),
                  ),
                ),
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextFormField(
                maxLines: 5,
                controller: scholarshipDescriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description ',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: appThemeColor)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appThemeColor),
                  ),
                ),
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Button(
                  height: height * 0.06,
                  width: double.infinity,
                  title: 'Submit',
                  radius: 6,
                  loading: object.loading.value,
                  onPress: () async {
                    if (scholarshipDeadlineController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Deadline is missing', Colors.red, context);
                    } else if (scholarshipProviderController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Provider is missing', Colors.red, context);
                    } else if (scholarshipLinkController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Link is missing', Colors.red, context);
                    } else if (scholarshipDescriptionController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Description is missing', Colors.red, context);
                    } else if (scholarshipNameController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          'Name is missing', Colors.red, context);
                    } else {
                      FocusScope.of(context).unfocus();
                      object.setLoading(true);
                      var iDate = DateTime.now().toString();
                      var id = DateTime.now().millisecondsSinceEpoch.toString();
                      Scholarship scholarship = Scholarship(
                          name: scholarshipNameController.text.toString(),
                          provider:
                              scholarshipProviderController.text.toString(),
                          deadline:
                              scholarshipDeadlineController.text.toString(),
                          description:
                              scholarshipDescriptionController.text.toString(),
                          link: scholarshipLinkController.text.toString(),
                          date: iDate,
                          scholarshipId: id);

                      FireStoreServices()
                          .addScholarshipData(scholarship, id, context)
                          .then((value) {
                        object.setLoading(false);
                        scholarshipNameController.clear();
                        scholarshipProviderController.clear();
                        scholarshipDeadlineController.clear();
                        scholarshipDescriptionController.clear();
                        scholarshipLinkController.clear();
                      }).onError((error, stackTrace) {
                        object.setLoading(false);
                      });
                    }
                    //------------------------------
                    NotificationServices().sendNotificationToAll(
                        'New Scholarships',
                        scholarshipProviderController.text.trim().toString());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
