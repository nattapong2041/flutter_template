import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_template/extension/colors.dart';
import 'package:flutter_template/extension/text_style.dart';

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
              ?.copyWith(fontSize: 21, color: colors.primaryColor),
        ),
        content: Text(
          message,
          style:
              textStyle.kanitNormalText?.copyWith(color: colors.primaryColor),
        ),
        actions: [
          if (onPressedCancle != null)
            TextButton(
              onPressed: onPressedCancle,
              child: Text(
                AppLocalizations.of(context)!.alertCancle,
                style: textStyle.kanitNormalText
                    ?.copyWith(color: colors.primaryColor),
              ),
            ),
          TextButton(
            onPressed: onPressedOk ?? () => Navigator.pop(context, 'OK'),
            child: Text(
              AppLocalizations.of(context)!.alertOk,
              style: textStyle.kanitNormalText
                  ?.copyWith(color: colors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
