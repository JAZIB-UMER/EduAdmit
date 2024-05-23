import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  // Loading
  final _loading = false.obs;
  get loading => _loading;

  setLoading(bool value) {
    _loading.value = value;
  }
}
