import 'package:flutter/material.dart';

class AuthScreenVM extends ChangeNotifier {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  bool buttonEnabled = false;
  bool loading = false;

  void validate() {
    bool allValid =
        loginController.text.isNotEmpty && passwordController.text.isNotEmpty;
    if (buttonEnabled != allValid) {
      buttonEnabled = allValid;
      notifyListeners();
    }
  }

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  void clearFields(){
    loginController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    loginController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
