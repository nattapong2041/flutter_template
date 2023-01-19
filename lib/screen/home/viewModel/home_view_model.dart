import 'dart:developer';

import 'package:flutter_template/base/base_service.dart';
import 'package:flutter_template/base/base_view_model.dart';

import '../../../base/pagination.dart';
import '../../../service/login/list_staff_service.dart';

class HomeViewModel extends BaseViewModel {
  Pagination _staffPagination = Pagination(size: 20);
  List<Staff> _listStaff = [];

  HomeViewModel() {
    fetchListStaff(shouldRefresh: true);
  }

  List<Staff> get listStaff => _listStaff;

  set listStaff(List<Staff> list) {
    _listStaff = list;
    notifyListeners();
  }

  Future<void> fetchListStaff({bool shouldRefresh = false}) async {
    if (apiState == ApiState.loading) return;
    if (shouldRefresh) {
      _listStaff.clear();
      _staffPagination = Pagination(size: 20);
    }
    if (!_staffPagination.hasNext) return;
    loadingState();

    ListStaffServiceRequest request = ListStaffServiceRequest(
        userId: '5049886d-1555-42ce-857c-97c3b543a209', searchKey: '');

    ListStaffService service = ListStaffService();
    await service.callService(request).then((value) {
      listStaff.addAll(value.detail?.listStaff ?? []);
      _staffPagination.setNext = 5;
      completedState();
    }).catchError((onError) {
      log(onError.toString());
      errorState(message: onError.toString());
    });
  }
}
