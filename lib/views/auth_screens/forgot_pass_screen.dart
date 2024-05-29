import 'package:edu_admit/resources/components/button.dart';
import 'package:edu_admit/services/auth_services/firebase_services.dart';
import 'package:edu_admit/utils/utilities.dart';
import 'package:edu_admit/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final FireBaseServices _firebaseservices = FireBaseServices();
  final object = Get.put(AuthViewModel());
  final emailForgotController = TextEditingController();

  final emailFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailForgotController.dispose();

    emailFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  'FORGOT PASSWORD',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Text(
                  'Enter your email address \n to recover your account',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: height * .03, bottom: height * 0.0003),
                  child: Column(
                    children: [
                      // For Email
                      TextFormField(
                        enabled: true,
                        controller: emailForgotController,
                        focusNode: emailFocusNode,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onFieldSubmitted: (newValue) {},
                        validator: (value) {
                          return value!.isEmpty ? 'Enter Email' : null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                      ),
                      // For Password
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Obx(() => Button(
                    loading: object.loading.value,
                    height: height * 0.07,
                    width: width * 0.84,
                    title: 'Send',
                    radius: 16,
                    onPress: () {
                      object.setLoading(true);
                      _firebaseservices
                          .forgotPassword(
                              context, emailForgotController.text.toString())
                          .then((value) {
                        emailForgotController.clear();
                        object.setLoading(false);
                        Utils.flushBarErrorMessage(
                            'Successfully Sent', Colors.green, context);
                      }).onError((error, stackTrace) {
                        object.setLoading(false);
                        Utils.flushBarErrorMessage(
                            'Failed to send', Colors.red, context);
                      });
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
