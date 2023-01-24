import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_template/base/base_service.dart';
import 'package:provider/provider.dart';

import '../../../base/base_screen.dart';
import '../../../common/widget/default_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../common/widget/loading_container.dart';
import '../../../extension/colors.dart';
import '../viewModel/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin<HomeView>, BaseScreen {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: const DefaultAppbar(),
      body: Selector<HomeViewModel, bool>(
          selector: (context, viewModel) =>
              (viewModel.apiState == ApiState.loading) &&
              viewModel.listStaff.isEmpty,
          builder: (context, shouldShowIndicator, widget) {
            return LoadingContainer(
              isLoading: shouldShowIndicator,
              child: const _ListStaff(),
            );
          }),
    );
  }
}

class _ListEmpty extends StatelessWidget {
  const _ListEmpty();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('JUST EMPTY LIST'),
    );
  }
}

class _ListStaff extends StatelessWidget with BaseScreen {
  const _ListStaff();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final scrollController = ScrollController();
    final colors = Theme.of(context).extension<AppColors>()!;
    if (viewModel.apiState == ApiState.error) {
      // Future.microtask(
      //   () => defaultAlertDialog(
      //       context: context, title: "Error", message: viewModel.message),
      // );
      return Center(
        child: Text(viewModel.message),
      );
    }
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (notification) {
        log(scrollController.position.pixels.toString());
        if (scrollController.position.pixels >
            (0.9 * scrollController.position.maxScrollExtent)) {
          viewModel.fetchListStaff();
        }
        return true;
      },
      child: RefreshIndicator(
          color: colors.primaryColor,
          onRefresh: () => viewModel.fetchListStaff(shouldRefresh: true),
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                kToolbarHeight -
                kBottomNavigationBarHeight,
            child: viewModel.listStaff.isEmpty
                ? const _ListEmpty()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: viewModel.listStaff.length,
                          itemBuilder: ((context, index) => SizedBox(
                              height: 40.0,
                              child: Text(
                                  viewModel.listStaff[index].firstName ?? ""))),
                        ),
                      ),
                      if ((viewModel.apiState == ApiState.loading) &&
                          viewModel.listStaff.isNotEmpty)
                        defaultLoading(),
                    ],
                  ),
          )),
    );
  }
}
