import 'package:apps_collection/home_page.dart';
import 'sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'registration_provider.dart';
import 'field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<RegistrationProvider>(context);
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://th.bing.com/th/id/OIP.TBfnMfhff7YqifMN-CXuxwHaHa?rs=1&pid=ImgDetMain",
                ),
                radius: 90,
                backgroundColor: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Field(
                        controller: prov.emailCtrl,
                        label: "Email",
                        icon: Icons.person,
                        validatorFunc: prov.fieldValidation,
                        initText: "test@example.com",
                      ),
                      Field(
                        controller: prov.passCtrl,
                        label: "Password",
                        icon: Icons.remove_red_eye,
                        validatorFunc: prov.fieldValidation,
                        initText: "test123",
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              TextButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    await prov.login();
                    var result = prov.loginResult;
                    Future.delayed(Duration(seconds: 2));
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(result!.message)));
                    if (result.status) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  }
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                ),
                child: const Text("Login"),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        ),
                    child: const Text("Register"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
