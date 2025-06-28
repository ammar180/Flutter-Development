import 'package:apps_collection/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './field.dart';
import 'registration_provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<RegistrationProvider>(context, listen: false);
    ;

    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: const Text("Sign UP")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Field(
                      controller: prov.nameCtrl,
                      label: "Your Name",
                      icon: Icons.person,
                      validatorFunc: prov.fieldValidation,
                    ),
                    Field(
                      controller: prov.registEmailCtrl,
                      label: "Email",
                      icon: Icons.email,
                      validatorFunc: prov.fieldValidation,
                    ),
                    Field(
                      controller: prov.phoneCtrl,
                      label: "Phone Number",
                      icon: Icons.phone,
                      validatorFunc: prov.fieldValidation,
                    ),
                    Field(
                      controller: prov.registPassCtrl,
                      label: "Password",
                      icon: Icons.remove_red_eye,
                      validatorFunc: prov.fieldValidation,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await prov.register();
                  var result = prov.signupResult;
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(result!.message)));
                  if (result.status) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  }
                }
              },
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.blue),
              ),
              child: const Text("Sign UP"),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already Have account? "),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Login"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
