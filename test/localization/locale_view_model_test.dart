import 'package:flutter/material.dart';
import 'package:flutter_template/localization/locale_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing Locale View Model', () {
    var viewModel = LocaleViewModel(const Locale('th', ''));

    test('Locale should be th', () {
      viewModel.set(const Locale('th', ''));
      expect(viewModel.locale, const Locale('th', ''));
    });

    test('Locale should be en', () {
      viewModel.set(const Locale('en', ''));
      expect(viewModel.locale, const Locale('en', ''));
    });
  });
}
