import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../extension/colors.dart';
import '../extension/text_style.dart';

abstract class BaseScreen {
  CircularProgressIndicator defaultLoading() {
    return const CircularProgressIndicator.adaptive();
  }

  Future<void> defaultAlertDialog({
    required BuildContext context,
    required String title,
    required String message,
    void Function()? onPressedOk,
    void Function()? onPressedCancle,
  }) async {
    final AppColors colors = Theme.of(context).extension<AppColors>()!;
    final AppTextTheme textStyle = Theme.of(context).extension<AppTextTheme>()!;
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          title,
          style: textStyle.kanitBoldText
              ?.copyWith(fontSize: 21, color: colors.primary),
        ),
        content: Text(
          message,
          style: textStyle.kanitNormalText?.copyWith(color: colors.primary),
        ),
        actions: [
          if (onPressedCancle != null)
            TextButton(
              onPressed: onPressedCancle,
              child: Text(
                AppLocalizations.of(context)!.alert_cancle,
                style:
                    textStyle.kanitNormalText?.copyWith(color: colors.primary),
              ),
            ),
          TextButton(
            onPressed: onPressedOk ?? () => Navigator.pop(context, 'OK'),
            child: Text(
              AppLocalizations.of(context)!.alert_ok,
              style: textStyle.kanitNormalText?.copyWith(color: colors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
