import 'package:flutter/material.dart';
import 'package:flutter_template/service/login/list_staff_service.dart';
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
    LoginServiceRequest request =
        LoginServiceRequest(username: "admin@tnl.com", password: "tnl1234!");

    LoginService service = LoginService();
    final result = service.callService(request).then((value) {
      print(value.detail);
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<void> listStaff() async {
    ListStaffServiceRequest request = ListStaffServiceRequest(
        userId: '5049886d-1555-42ce-857c-97c3b543a209', searchKey: 'god');

    ListStaffService service = ListStaffService();
    final result = service.callService(request).then((value) {
      print(value.detail);
    }).catchError((onError) {
      print(onError);
    });
  }
}
