import 'package:email_validator/email_validator.dart';

class Validators {
  static emailFormValidator(String? email) {
    if (!EmailValidator.validate(email ?? '')) {
      return "Completa con un email válido";
    }

    return null;
  }

  static passwordFormValidator(String? password) {
    if (password == null || password.isEmpty || password.length < 5) {
      return "Completa con una contraseña válida";
    }

    return null;
  }
}
