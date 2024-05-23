import 'package:edu_admit/data_model/universities_model.dart';
import 'package:edu_admit/services/data_services/firestore_services.dart';
import 'package:edu_admit/utils/colors.dart';
import 'package:edu_admit/utils/utilities.dart';
import 'package:edu_admit/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../resources/components/button.dart';

class UniversityFormScreen extends StatefulWidget {
  const UniversityFormScreen({super.key});

  @override
  State<UniversityFormScreen> createState() => _UniversityFormScreenState();
}

class _UniversityFormScreenState extends State<UniversityFormScreen> {
  final TextEditingController _bgImageController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _lastDateController = TextEditingController();

  final TextEditingController _linkController = TextEditingController();

  final TextEditingController _locationController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneNoController = TextEditingController();

  final TextEditingController _rankController = TextEditingController();

  final TextEditingController _logoController = TextEditingController();

  final TextEditingController _scholarshipsLinkController =
      TextEditingController();

  AuthViewModel object = Get.put(AuthViewModel());

  @override
  void dispose() {
    _bgImageController.dispose();
    _descriptionController.dispose();
    _emailController.dispose();
    _lastDateController.dispose();
    _linkController.dispose();
    _locationController.dispose();
    _nameController.dispose();
    _phoneNoController.dispose();
    _rankController.dispose();
    _logoController.dispose();
    _scholarshipsLinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: InkWell(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        backgroundColor: appThemeColor,
        title: Text(
          'Upload Data',
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'University Name',
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
                controller: _bgImageController,
                decoration: const InputDecoration(
                  labelText: 'Background Image Link',
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
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'University Description',
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
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'University Email',
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
                controller: _lastDateController,
                decoration: const InputDecoration(
                  labelText: 'Admission last date(xxxx-x-x)',
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
                controller: _linkController,
                decoration: const InputDecoration(
                  labelText: 'University Link',
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
                controller: _locationController,
                decoration: const InputDecoration(
                  labelText: 'University Location',
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
                keyboardType: TextInputType.number,
                controller: _phoneNoController,
                decoration: const InputDecoration(
                  labelText: 'University Phone',
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
                keyboardType: TextInputType.number,
                controller: _rankController,
                decoration: const InputDecoration(
                  labelText: 'University Rank',
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
                controller: _logoController,
                decoration: const InputDecoration(
                  labelText: 'Logo Image Link',
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
                controller: _scholarshipsLinkController,
                decoration: const InputDecoration(
                  labelText: 'Uni Scholarship link',
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
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Email is missing', Colors.red, context);
                  } else if (_nameController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Name is missing', Colors.red, context);
                  } else if (_scholarshipsLinkController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Scholarship Link is missing', Colors.red, context);
                  } else if (_logoController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Logo is missing', Colors.red, context);
                  } else if (_descriptionController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Description is missing', Colors.red, context);
                  } else if (_linkController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Link is missing', Colors.red, context);
                  } else if (_locationController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Location is missing', Colors.red, context);
                  } else if (_nameController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Name is missing', Colors.red, context);
                  } else if (_phoneNoController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'PhoneNo is missing', Colors.red, context);
                  } else if (_rankController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Rank is missing', Colors.red, context);
                  } else if (_logoController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Logo Link is missing', Colors.red, context);
                  } else {
                    object.setLoading(true);
                    Admission admission = Admission(
                        admission: false,
                        bgImage: _bgImageController.text.toString(),
                        description: _descriptionController.text.toString(),
                        email: _emailController.text.toString(),
                        lastDate: _lastDateController.text.toString(),
                        link: _linkController.text.toString(),
                        location: _locationController.text.toString(),
                        name: _nameController.text.toString(),
                        phoneNo: _phoneNoController.text.toString(),
                        rank: int.parse(_rankController.text.toString()),
                        logo: _logoController.text.toString(),
                        scholarshipsLink:
                            _scholarshipsLinkController.text.toString());

                    FireStoreServices()
                        .addUniData(admission, context)
                        .then((value) {
                      object.setLoading(false);
                      _bgImageController.clear();
                      _descriptionController.clear();
                      _emailController.clear();
                      _lastDateController.clear();
                      _linkController.clear();
                      _locationController.clear();
                      _nameController.clear();
                      _phoneNoController.clear();
                      _rankController.clear();
                      _logoController.clear();
                      _scholarshipsLinkController.clear();
                    }).onError((error, stackTrace) {
                      object.setLoading(false);
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
