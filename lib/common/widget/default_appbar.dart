import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../extension/colors.dart';
import '../../localization/locale_view_model.dart';

class DefaultAppbar extends StatelessWidget with PreferredSizeWidget {
  const DefaultAppbar({super.key, this.title});
  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    AppColors colors = Theme.of(context).extension<AppColors>()!;
    //final viewModel = context.read<LocaleViewModel>();
    return AppBar(
      title: Text(title ?? AppLocalizations.of(context)!.appTitle),
      backgroundColor: colors.primaryColor,
      actions: [
        //! temporary disable language change button
        // Row(
        //   children: [
        //     const Text('TH'),
        //     Switch.adaptive(
        //         value: viewModel.locale?.languageCode == 'th',
        //         onChanged: (value) {
        //           if (viewModel.locale?.languageCode == 'th') {
        //             viewModel.set(const Locale('en', ''));
        //           } else {
        //             viewModel.set(const Locale('th', ''));
        //           }
        //         }),
        //   ],
        // )
      ],
    );
  }
}
