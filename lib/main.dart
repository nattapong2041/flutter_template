import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'extension/colors.dart';
import 'extension/text_style.dart';
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
      create: (context) => LocaleViewModel(),
      child:
          Consumer<LocaleViewModel>(builder: (context, localeViewModel, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
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
          theme: ThemeData(
            extensions: <ThemeExtension<dynamic>>[
              AppColors(
                primaryColor: HexColor.fromHex("#000000"),
                danger: HexColor.fromHex("#000000"),
              ),
              const AppTextTheme(
                kanitNormalText: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Kanit',
                ),
                kanitBoldText: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Kanit',
                ),
              ),
            ],
          ),
          routes: {
            '/': (context) => const MainScreen(),
          },
          initialRoute: '/',
        );
      }),
    );
  }
}
