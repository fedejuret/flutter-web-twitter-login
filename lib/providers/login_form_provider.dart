import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String email = '';
  String password = '';

  // String get email => this.email;

  validateForm() {
    if (formKey.currentState!.validate()) {
      print('Form valid ... Login');
    } else {
      print('Form not valid');
    }
  }
}
