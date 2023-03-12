import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_template/base/base_view_model.dart';

import '../../../base/base_service.dart';
import '../../../firebase_options.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel() {
    initialization();
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        //Navigator.pushReplacementNamed(context, AppRouteName.login);
      } else {
        print('User is signed in!');
      }
    });
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }

  Future<void> loginWithEmail(String username, String password) async {
    if (apiState == ApiState.loading) return;
    loadingState();
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: "tar.empty@gmail.com", password: "guitar3569")
          .then((value) => {});
    } on FirebaseAuthException catch (onError) {
      log('Failed with error code: ${onError.code}');
      errorState(message: onError.message);
    }
  }

  Future<void> registerWithEmail(String username, String password) async {
    if (apiState == ApiState.loading) return;
    loadingState();
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "tar.empty@gmail.com", password: "guitar3569")
          .then((value) => {});
    } on FirebaseAuthException catch (onError) {
      log('Failed with error code: ${onError.code}');
      errorState(message: onError.message);
    }
  }
}
