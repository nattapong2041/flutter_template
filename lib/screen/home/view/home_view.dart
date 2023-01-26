import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../base/base_screen.dart';
import '../../../base/base_service.dart';
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
              child: const _Display(),
            );
          }),
    );
  }
}

class _Display extends StatelessWidget with BaseScreen {
  const _Display();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    if (viewModel.apiState == ApiState.error) {
      // Future.microtask(
      //   () => defaultAlertDialog(
      //       context: context, title: "Error", message: viewModel.message),
      // );
      return const _ErrorDisplay();
    }
    return viewModel.listStaff.isEmpty
        ? const _ListEmpty()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                child: _ListStaff(),
              ),
              if ((viewModel.apiState == ApiState.loading) &&
                  viewModel.listStaff.isNotEmpty)
                defaultLoading(),
            ],
          );
  }
}

class _ErrorDisplay extends StatelessWidget {
  const _ErrorDisplay();

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = context.read<HomeViewModel>();
    final colors = Theme.of(context).extension<AppColors>()!;
    return RefreshIndicator(
      color: colors.primaryColor,
      onRefresh: () => viewModel.fetchListStaff(shouldRefresh: true),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              kToolbarHeight -
              kBottomNavigationBarHeight -
              kTextTabBarHeight,
          child: Center(
            child: Text(viewModel.message),
          ),
        ),
      ),
    );
  }
}

class _ListStaff extends StatelessWidget {
  const _ListStaff();

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final HomeViewModel viewModel = context.watch<HomeViewModel>();
    final colors = Theme.of(context).extension<AppColors>()!;

    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (notification) {
        if (scrollController.position.pixels >
            (0.9 * scrollController.position.maxScrollExtent)) {
          viewModel.fetchListStaff();
        }
        return true;
      },
      child: RefreshIndicator(
        color: colors.primaryColor,
        onRefresh: () => viewModel.fetchListStaff(shouldRefresh: true),
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          itemCount: viewModel.listStaff.length,
          itemBuilder: ((context, index) => SizedBox(
              height: 40.0,
              child: Text(viewModel.listStaff[index].firstName ?? ""))),
        ),
      ),
    );
  }
}

class _ListEmpty extends StatelessWidget {
  const _ListEmpty();

  @override
  Widget build(BuildContext context) {
    final HomeViewModel viewModel = context.read<HomeViewModel>();
    final colors = Theme.of(context).extension<AppColors>()!;
    return RefreshIndicator(
      color: colors.primaryColor,
      onRefresh: () => viewModel.fetchListStaff(shouldRefresh: true),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              kToolbarHeight -
              kBottomNavigationBarHeight -
              kTextTabBarHeight,
          child: const Center(
            child: Text('JUST EMPTY LIST'),
          ),
        ),
      ),
    );
  }
}
