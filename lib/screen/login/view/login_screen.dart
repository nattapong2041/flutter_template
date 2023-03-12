import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/common/validator.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).colorScheme.background,
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Hospital Lover',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                  Text(
                    'Email',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextFormField(
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (!value.isEmail()) {
                        return 'please enter correct email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextFormField(
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (!value.isEmail()) {
                        return 'please enter correct email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        child: Text("Login"),
                        onPressed: () {
                          log("login");
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Text(
                      "Don't have any account? ",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      width: 200,
                      child: TextButton(
                        child: Text("Register"),
                        onPressed: () {
                          log("register");
                          FirebaseAuth.instance.createUserWithEmailAndPassword(
                              email: "tar.empty@gmail.com",
                              password: "guitar3569");
                        },
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
