import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../localization/locale_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmohView extends StatefulWidget {
  const EmohView({super.key, required this.title});
  final String title;

  @override
  State<EmohView> createState() => _EmohViewState();
}

class _EmohViewState extends State<EmohView>
    with AutomaticKeepAliveClientMixin<EmohView> {
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
        backgroundColor: Colors.green,
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
