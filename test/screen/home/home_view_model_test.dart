// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
import 'dart:convert';

import 'package:flutter_template/base/api_exception.dart';
import 'package:flutter_template/base/base_service.dart';
import 'package:flutter_template/common/config.dart';
import 'package:flutter_template/screen/home/viewModel/home_view_model.dart';
import 'package:flutter_template/service/login/list_staff_service.dart';
import 'package:flutter_template/service/login/login_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

//@GenerateNiceMocks([MockSpec<ListStaffService>()])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  group('Home view model', () {
    test('HomeViewModel contruct being call', () async {
      final viewModel = FakeHomeViewModel();
      expect(viewModel.listStaff.length, 1);
    });
  });
}

class FakeHomeViewModel extends Fake implements HomeViewModel {
  List<Staff> _listStaff = [];

  @override
  List<Staff> get listStaff => _listStaff;

  @override
  FakeHomeViewModel() {
    fetchListStaff(shouldRefresh: true);
  }

  @override
  Future<void> fetchListStaff({bool shouldRefresh = false}) async {
    _listStaff = [Staff(1, "staffNo", "gender", "firstName", "lastName", 1)];
  }
}
