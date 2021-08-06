import 'package:admin_dashboard/helpers/validators.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerProvider =
            Provider.of<RegisterFormProvider>(context, listen: false);

        return Container(
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 370),
              child: Form(
                key: registerProvider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) => registerProvider.name = value,
                      validator: (value) {
                        if (value == null) {
                          return "Debe completar con su nombre";
                        } else if (value.length < 3) {
                          return "Inserte un nombre válido";
                        }

                        return null;
                      },
                      decoration: CustomInputs.authInputDecoration(
                          hint: 'Ingrese su nombre',
                          label: 'Nombre',
                          icon: Icons.verified_user),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      // validator: ,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) => registerProvider.email = value,
                      validator: (value) =>
                          Validators.emailFormValidator(value),
                      decoration: CustomInputs.authInputDecoration(
                        hint: 'Ingrese su correo',
                        label: 'Email',
                        icon: Icons.email_outlined,
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      onChanged: (value) => registerProvider.password = value,
                      validator: (value) =>
                          Validators.passwordFormValidator(value),
                      decoration: CustomInputs.authInputDecoration(
                        hint: '*************',
                        label: 'Contraseña',
                        icon: Icons.lock_outlined,
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomOutlinedButton(
                      onPressed: () => registerProvider.validateForm(),
                      text: 'Crear Cuenta',
                    ),
                    SizedBox(height: 30),
                    LinkText(
                      text: 'Iniciar sesión',
                      onPressed: () {
                        Navigator.pushNamed(context, Flurorouter.loginRoute);
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
