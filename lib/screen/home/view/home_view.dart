import 'package:flutter/material.dart';
import 'package:flutter_template/base/base_screen.dart';
import 'package:flutter_template/extension/colors.dart';
import 'package:flutter_template/screen/home/viewModel/home_view_model.dart';
import 'package:provider/provider.dart';

import '../../../common/widget/default_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    Future.microtask(
      () {
        defaultAlertDialog(
            context: context, title: "title", message: "message");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: const DefaultAppbar(),
      body: Selector<HomeViewModel, bool>(
          selector: (context, viewModel) =>
              viewModel.isLoading && viewModel.listStaff.isEmpty,
          builder: (context, shouldShowIndicator, widget) {
            if (shouldShowIndicator) {
              return Center(child: defaultLoading());
            } else {
              return const _ListStaff();
            }
          }),
    );
  }
}

class _ListEmpty extends StatelessWidget {
  const _ListEmpty({super.key});

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
                        itemBuilder: ((context, index) =>
                            Text(viewModel.listStaff[index].firstName ?? "")),
                      ),
                    ),
                    if (viewModel.isLoading && viewModel.listStaff.isNotEmpty)
                      defaultLoading(),
                  ],
                ),
        ),
      ),
    );
  }
}
