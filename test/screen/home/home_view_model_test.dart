import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_template/base/api_exception.dart';
import 'package:flutter_template/base/base_service.dart';
import 'package:flutter_template/screen/home/viewModel/home_view_model.dart';
import 'package:flutter_template/service/login/list_staff_service.dart';

import 'home_view_model_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ListStaffService>()])
void main() {
  late HomeViewModel viewModel;
  MockListStaffService service = MockListStaffService();
  final response1 = ListStaffServiceResponse(ListStaffResult([]));
  final response2 = ListStaffServiceResponse(
    ListStaffResult(
      [
        Staff(1, "staffNo1", "Male", "firstName1", "lastName1", 1),
        Staff(2, "staffNo2", "Male", "firstName2", "lastName1", 0)
      ],
    ),
  );
  setUp(
    () {
      when(service.callService(any))
          .thenAnswer((realInvocation) async => response2);

      viewModel = HomeViewModel(service);
    },
  );

  tearDown(() => null);
  group('Home view model', () {
    test('HomeViewModel contruct being call', () async {
      when(service.callService(any))
          .thenAnswer((realInvocation) async => response1);

      viewModel = HomeViewModel(service);
      verify(await service.callService(any));
      expect(viewModel.listStaff, response1.detail?.listStaff ?? []);
    });

    test('can get listStaff value', () async {
      when(service.callService(any))
          .thenAnswer((realInvocation) async => response2);

      viewModel = HomeViewModel(service);

      //wait for fetch data in contruct is done
      await Future.delayed(const Duration(microseconds: 100));
      expect(viewModel.listStaff, response2.detail?.listStaff ?? []);
    });

    test('can set listStaff value', () async {
      viewModel.listStaff = response1.detail?.listStaff ?? [];
      expect(viewModel.listStaff, response1.detail?.listStaff ?? [],
          reason: "set with response1");

      viewModel.listStaff = response2.detail?.listStaff ?? [];
      expect(viewModel.listStaff, response2.detail?.listStaff ?? [],
          reason: "set with response2");
    });

    test('can fetch listStaff', () async {
      //wait for fetch data in contruct is done
      await Future.delayed(const Duration(seconds: 1));
      //is pagination working
      await viewModel.fetchListStaff();
      expect(
          viewModel.listStaff.length >
              (response2.detail?.listStaff?.length ?? 0),
          true,
          reason: "call with pagination value should >");

      await viewModel.fetchListStaff(shouldRefresh: true);
      expect(
          viewModel.listStaff.length ==
              (response2.detail?.listStaff?.length ?? 0),
          true,
          reason: "reset with response2 value should equal");
    });

    test('can fetch listStaff handling error', () async {
      when(service.callService(any)).thenAnswer(
          (realInvocation) async => throw FetchDataException("Error"));

      viewModel = HomeViewModel(service);
      //wait for fetch data in contruct is done
      await Future.delayed(const Duration(milliseconds: 100));

      expect(viewModel.apiState, ApiState.error,
          reason: "ApiState of this view model should be error state");
    });
  });
}
