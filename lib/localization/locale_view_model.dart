import 'package:flutter/material.dart';
import 'package:flutter_template/service/login/login_service.dart';

//Use this model with Material app in: lib/main.dart

class LocaleViewModel extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void set(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  Future<void> login() async {
    LoginServiceRequest request = const LoginServiceRequest(
        Username: "admin@tnl.com", Password: "tnl1234!");

    LoginService service = LoginService();
    final result = service.callService(request).then((value) {
      print(value);
    }).catchError((onError) {
      print(onError);
    });
  }
}
