import 'package:flutter/material.dart';

import '../../base/base_screen.dart';

class LoadingContainer extends StatelessWidget with BaseScreen {
  const LoadingContainer(
      {super.key, required this.child, required this.isLoading});

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading ? Center(child: defaultLoading()) : child;
  }
}
