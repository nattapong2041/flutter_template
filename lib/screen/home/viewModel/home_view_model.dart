import 'package:flutter/material.dart';
import 'package:flutter_template/base/pagination.dart';
import 'package:flutter_template/service/login/list_staff_service.dart';
import 'package:flutter_template/service/login/login_service.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isLoading = false;
  Pagination staffPagination = Pagination(size: 20);
  List<Staff> listStaff = [];

  HomeViewModel() {
    fetchListStaff(shouldRefresh: true);
  }
  bool get isLoading => _isLoading;

  Future<void> login() async {
    LoginServiceRequest request =
        LoginServiceRequest(username: "admin@tnl.com", password: "tnl1234!");

    LoginService service = LoginService();
    await service.callService(request).then((value) {
      print(value.detail);
    }).catchError((onError) {
      print(onError);
    });
  }

  Future<void> fetchListStaff({bool shouldRefresh = false}) async {
    if (_isLoading) return;
    if (shouldRefresh) {
      listStaff.clear();
      staffPagination = Pagination(size: 20);
    }
    if (!staffPagination.hasNext) return;
    _isLoading = true;
    notifyListeners();

    ListStaffServiceRequest request = ListStaffServiceRequest(
        userId: '5049886d-1555-42ce-857c-97c3b543a209', searchKey: 'god');

    ListStaffService service = ListStaffService();
    await Future.delayed(Duration(seconds: 5));
    await service.callService(request).then((value) {
      listStaff.addAll(value.detail?.listStaff ?? []);
      staffPagination.setNext = 5;
      _isLoading = false;
      notifyListeners();
    }).catchError((onError) {
      print(onError);
      _isLoading = false;
      notifyListeners();
    });
  }
}
