import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../localization/locale_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});
  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin<HomeView> {
  @override
  bool get wantKeepAlive => true;

  int _counter = 0;

  void _incrementCounter() {
    if (context.read<LocaleViewModel>().locale == const Locale('th', '')) {
      context.read<LocaleViewModel>().set(const Locale('en', ''));
    } else {
      context.read<LocaleViewModel>().set(const Locale('th', ''));
    }
    _counter++;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(AppLocalizations.of(context)!.helloWorld),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
