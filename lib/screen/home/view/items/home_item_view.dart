import 'package:flutter/material.dart';
import 'package:flutter_template/extension/text_style.dart';

import '../../../../common/widget/app_image.dart';
import '../../../../service/login/list_staff_service.dart';

class HomeItem extends StatelessWidget {
  const HomeItem(this.staff, {super.key});
  final Staff staff;
  @override
  Widget build(BuildContext context) {
    final AppTextTheme font = Theme.of(context).extension<AppTextTheme>()!;
    return Row(
      children: [
        const AppUrlImage(
          'http://via.placeholder.com/350x150',
          height: 30,
        ),
        Text(
          " ${staff.staffNo} ${staff.firstName} ${staff.lastName}",
          style: font.kanitNormalText,
        )
      ],
    );
  }
}
