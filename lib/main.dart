import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/common/app_route_name.dart';
import 'package:provider/provider.dart';

import 'extension/app_theme.dart';
import 'localization/locale_view_model.dart';
import 'screen/main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleViewModel(const Locale('th')),
      child:
          Consumer<LocaleViewModel>(builder: (context, localeViewModel, child) {
        return MaterialApp(
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
          locale: localeViewModel.locale,
          theme: AppTheme.mainTheme,
          //* dark theme if need
          //darkTheme: AppTheme.mainTheme,
          routes: {
            AppRouteName.home: (context) => const MainScreen(),
          },
          initialRoute: AppRouteName.home,
        );
      }),
    );
  }
}
