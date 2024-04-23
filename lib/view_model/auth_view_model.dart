import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  // Loading
  final _loading = false.obs;
  get loading => _loading;

  // obscure Text
  // bool _obscureText = true;
  // bool get obscureText => _obscureText;

  // changeObscure() {
  //   _obscureText = !_obscureText;
  //   notifyListeners();
  // }

  setLoading(bool value) {
    _loading.value = value;
  }
}
