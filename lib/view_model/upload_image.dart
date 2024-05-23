import 'dart:io';

import 'package:edu_admit/services/auth_services/user_id.dart';
import 'package:edu_admit/utils/utilities.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage extends GetxController {
  final _loading = false.obs;
  get loading => _loading;

  setLoading(bool value) {
    _loading.value = value;
  }

  //RealTime DataBase
  DatabaseReference databaseReference =
      FirebaseDatabase.instance.ref().child('User');

  File? _image;
  final RxString _newUrl = ''.obs;

  RxString? get newUrl => _newUrl;

  setNewUrl(String value) {
    _newUrl.value = value;
  }

  File? get image => _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if (pickedFile != null) {
      _image = File(pickedFile.path);

      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref('/user_profile/${SessionController().userId.toString()}');
      firebase_storage.UploadTask uploadTask = ref.putFile(_image!.absolute);

      await Future.value(uploadTask).then((value) async {
        await ref
            .getDownloadURL()
            .then((value) => {setNewUrl(value)}); //notifyListeners();
        databaseReference
            .child(SessionController().userId.toString())
            .update({'image': newUrl.toString()});
      }).onError((error, stackTrace) {
        Utils.toastMessage(error.toString());
      });
    } else {
      Utils.toastMessage('No Image Picked');
    }
  }

  Future<String> getImageUrl() async {
    // Get reference to the image stored in Firebase Storage

    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('/user_profile/${SessionController().userId.toString()}');

    try {
      // Get the download URL for the image
      await ref.getDownloadURL().then((value) => {
            setNewUrl(value),
          });

      // Update the imageUrl variable with the download URL
    } catch (e) {
      Utils.toastMessage('No Image Found');
    }
    return newUrl!.value;
  }
}
