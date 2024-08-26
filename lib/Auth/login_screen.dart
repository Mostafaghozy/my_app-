import 'package:firebase_auth/firebase_auth.dart';

// import 'package:first_app/api_provider.dart';

import 'package:flutter/material.dart';

// import 'package:dio/dio.dart';

import '../bottom_navigation/home_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool visible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'email address must not be empty';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    labelText: "mail",
                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passWordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: visible,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "PassWord",
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          visible = !visible;
                        });
                      },
                      icon: Icon(
                          visible ? Icons.visibility : Icons.visibility_off),
                    ),
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                color: Colors.blue,
                child: MaterialButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      print(emailController.text);
                      print(passWordController.text);
                      await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: emailController.text,
                              password: passWordController.text)
                          .then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Success"),
                          ),
                        );
                        print(value.user?.email);
                        print(value.user?.uid);
                      }).catchError((error) {
                        print("error");
                        print(error.toString());
                      });

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreeen()));
                    }
                  },
                  child: const Text("login"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Don't have an acocount"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    child: Text("Register"),
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
