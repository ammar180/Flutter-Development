import 'package:flutter/material.dart';
import './login_page.dart';
import './my_textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.title});
  final String title;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            width: 400,
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Image(
                      image: NetworkImage(
                          'https://th.bing.com/th/id/R.9b0a191fc297ce2038ad574eeceee77a?rik=xye3iVKYqpog1g&pid=ImgRaw&r=0'),
                      width: 200,
                      height: 100,
                    ),
                    MyTextfield(
                        hintText: "Email", controller: TextEditingController()),
                    MyTextfield(
                        hintText: "User Name",
                        controller: TextEditingController()),
                    MyTextfield(
                        hintText: "Password",
                        controller: TextEditingController()),
                    MyTextfield(
                        hintText: "Confirm Password",
                        controller: TextEditingController()),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => (),
                      style: const ButtonStyle(
                        padding: WidgetStatePropertyAll(EdgeInsets.all(15)),
                        minimumSize: WidgetStatePropertyAll(Size(200, 50)),
                        backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      ),
                      child: const Text(
                        "Sign UP",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already Register? "),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginPage(title: "Login Page")));
                        },
                        child: const Text("Login"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
