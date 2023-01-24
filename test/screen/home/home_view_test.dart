import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_template/base/api_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

import 'package:flutter_template/extension/app_theme.dart';
import 'package:flutter_template/screen/home/viewModel/home_view_model.dart';
import 'package:flutter_template/service/login/list_staff_service.dart';
import 'package:flutter_template/screen/home/view/home_view.dart';
import 'home_view_model_test.mocks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget makeTesteableWidget({required Widget child}) => MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Template',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('th', ''), // Thai, no country code
      ],
      locale: const Locale('th'),
      theme: AppTheme.mainTheme,
      home: child,
    );

void main() {
  final response1 = ListStaffServiceResponse(ListStaffResult([]));
  final response2 = ListStaffServiceResponse(
    ListStaffResult(
      [
        Staff(1, "staffNo1", "Male", "firstName1", "lastName1", 1),
        Staff(2, "staffNo2", "Male", "firstName2", "lastName1", 0),
        Staff(2, "staffNo2", "Male", "firstName2", "lastName1", 0),
        Staff(2, "staffNo2", "Male", "firstName2", "lastName1", 0),
        Staff(2, "staffNo2", "Male", "firstName2", "lastName1", 0),
        Staff(2, "staffNo2", "Male", "firstName2", "lastName1", 0),
        Staff(2, "staffNo2", "Male", "firstName2", "lastName1", 0),
        Staff(2, "staffNo2", "Male", "firstName2", "lastName1", 0),
        Staff(2, "staffNo2", "Male", "firstName2", "lastName1", 0),
        Staff(2, "staffNo2", "Male", "firstName2", "lastName1", 0),
        Staff(2, "staffNo2", "Male", "firstName2", "lastName1", 0),
        Staff(2, "staffNo2", "Male", "firstName2", "lastName1", 0),
        Staff(2, "staffNo2", "Male", "firstName2", "lastName1", 0),
        Staff(2, "staffNo2", "Male", "firstName2", "lastName1", 0),
        Staff(2, "staffNo2", "Male", "firstName2", "lastName1", 0),
        Staff(2, "staffNo2", "Male", "firstName2", "lastName1", 0),
        Staff(2, "staffNo2", "Male", "firstName2", "lastName1", 0),
        Staff(99, "staffNo99", "Male", "lastStaff", "lastName1", 0),
      ],
    ),
  );
  final responseError = FetchDataException("error");

  group('on fetch data with', () {
    testWidgets('HomeView show up and display list view if have data',
        (tester) async {
      //*arrange
      final service = MockListStaffService();
      when(service.callService(any))
          .thenAnswer((realInvocation) async => response2);

      await tester.pumpWidget(
        makeTesteableWidget(
            child: ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(service),
          child: const HomeView(),
        )),
      );

      //*act
      await tester.pumpAndSettle();

      // Create the Finders.
      final appbarFinder = find.textContaining("Flutter ");
      final listViewFinder = find.byType(ListView);

      //*assert
      expect(appbarFinder, findsOneWidget, reason: "appbar show up");
      expect(listViewFinder, findsOneWidget, reason: "listview show up");
    });

    testWidgets('can scroll then use pagination', (tester) async {
      //*arrange
      final service = MockListStaffService();
      when(service.callService(any))
          .thenAnswer((realInvocation) async => response2);
      final viewModel = HomeViewModel(service);
      await tester.pumpWidget(
        makeTesteableWidget(
            child: ChangeNotifierProvider<HomeViewModel>(
          create: (context) => viewModel,
          child: const HomeView(),
        )),
      );

      //*act
      await tester.pumpAndSettle();

      final listViewFinder = find.byType(Scrollable);
      final itemFinder = find.text("lastStaff");

      // Scroll until the item to be found appears.
      await tester.scrollUntilVisible(
        itemFinder,
        500.0,
        scrollable: listViewFinder,
      );

      await tester.pumpAndSettle();
      //*assert
      expect(viewModel.listStaff.length,
          (response2.detail?.listStaff?.length ?? 0) * 2,
          reason: "length should double after pagi");
    });

    testWidgets('display empty list if have no data', (tester) async {
      final service = MockListStaffService();
      when(service.callService(any))
          .thenAnswer((realInvocation) async => response1);

      //pump widget
      await tester.pumpWidget(
        makeTesteableWidget(
            child: ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(service),
          child: const HomeView(),
        )),
      );

      //like setstate: reload screen
      await tester.pumpAndSettle();

      // Create the Finders.
      final emptyListFinder = find.text('JUST EMPTY LIST');

      expect(emptyListFinder, findsOneWidget);
    });
  });
  group('on error', () {
    testWidgets('can show error message', (tester) async {
      //*arrange
      final service = MockListStaffService();
      when(service.callService(any))
          .thenAnswer((realInvocation) async => throw responseError);

      final viewModel = HomeViewModel(service);
      await tester.pumpWidget(
        makeTesteableWidget(
            child: ChangeNotifierProvider<HomeViewModel>(
          create: (context) => viewModel,
          child: const HomeView(),
        )),
      );

      //*act
      await tester.pumpAndSettle();
      // Create the Finders.

      final errorText = find.text("Error During Communication: error");
      //final errorText = find.textContaining("error");
      //*assert
      expect(errorText, findsOneWidget, reason: "should find error text");
    });
  });

  group('on refresh', () {
    testWidgets('can refresh on empty list', (tester) async {});

    testWidgets('can refresh on list less than screen', (tester) async {});

    testWidgets('can refresh on list more than screen', (tester) async {});

    testWidgets('can refresh on error message', (tester) async {});
  });
}
