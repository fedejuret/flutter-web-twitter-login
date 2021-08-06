import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/helpers/validators.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(builder: (context) {
        final loginFormProvider =
            Provider.of<LoginFormProvider>(context, listen: false);

        return Container(
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 370),
              child: Form(
                key: loginFormProvider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) => loginFormProvider.email = value,
                      validator: (value) =>
                          Validators.emailFormValidator(value),
                      decoration: CustomInputs.authInputDecoration(
                        hint: 'Ingrese su correo',
                        label: 'Email',
                        icon: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) => loginFormProvider.password = value,
                      validator: (value) =>
                          Validators.passwordFormValidator(value),
                      decoration: CustomInputs.authInputDecoration(
                        hint: '*************',
                        label: 'Contraseña',
                        icon: Icons.lock_outlined,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomOutlinedButton(
                      onPressed: () {
                        if (loginFormProvider.validateForm()) {
                          authProvider.login(loginFormProvider.email,
                              loginFormProvider.password);
                        }
                      },
                      text: 'Ingresar',
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    LinkText(
                      text: 'Nueva cuenta',
                      onPressed: () {
                        Navigator.pushNamed(context, Flurorouter.registerRoute);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
