import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/Auth/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                "Register",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passWordController.text);

                      /*await ApiProvider()
                              .userLogin(
                              userName: emailController.text,
                              password: passWordController.text)
                              .then((value) {
                            print(value);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text("$value")));
                          });*/
                    }
                  },
                  child: const Text("Register"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("have an acocount"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text("Login"),
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
