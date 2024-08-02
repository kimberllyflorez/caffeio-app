import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/features/home/home_vm.dart';
import 'package:caffeio/app/features/home/widgets/home_history_list_wd.dart';
import 'package:caffeio/app/features/home/widgets/home_methods_list_wd.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/app/res/assets.dart';
import 'package:caffeio/app/res/strings.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:caffeio/design_system/atoms/container/caffeio_bottom_container.dart';
import 'package:caffeio/design_system/atoms/loading/loading_indicator.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:caffeio/design_system/theme/insets.dart';
import 'package:caffeio/design_system/theme/spacing.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ViewState<HomePage, HomeViewModel> {
  @override
  void initState() {
    super.initState();
    listenToNavigation(viewModel.router);
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return StreamBuilder<HomePageState>(
      stream: viewModel.state,
      builder: (context, snapshot) {
        final state = snapshot.data ?? const HomePageState();
        return Scaffold(
          backgroundColor: theme.palette.blueScale.primaryColor,
          appBar: AppBar(
            backgroundColor: theme.palette.blueScale.primaryColor,
            iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
            title: Text(
              CaffeioStrings.home,
              style: theme.typo.subtitle.copyWith(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            actions: [
              if (state.isUserLogged)
                IconButton(
                  onPressed: viewModel.onUserPressed,
                  icon: const Icon(Icons.account_circle_outlined),
                )
            ],
          ),
          body: Visibility(
            visible: !state.loading,
            replacement: const LoadingIndicator(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: CaffeioSpacing.xs),
                Padding(
                  padding: CaffeioInsets.xs.toLRB,
                  child: Text(
                    CaffeioStrings.meetMethods,
                    style: context.theme.typo.subtitle.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                HomeMethodsList(
                  methods: state.brewingMethods,
                  callback: viewModel.onMethodPressed,
                ),
                const SizedBox(height: CaffeioSpacing.s),
                Expanded(
                  child: CaffeioBottomContainer(
                    backgroundColor: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: CaffeioSpacing.s),
                        Padding(
                          padding: CaffeioInsets.xs.toLRB,
                          child: Text(
                            CaffeioStrings.brewingHistory,
                            style: context.theme.typo.subtitle,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Expanded(
                          child: Visibility(
                            visible: state.isUserLogged,
                            replacement: Center(
                              child: TextButton(
                                onPressed: viewModel.onLoginPressed,
                                child: const Text(CaffeioStrings.loginToStart),
                              ),
                            ),
                            child: Visibility(
                              visible: state.userBrews.isNotEmpty,
                              replacement: Center(
                                child: CaffeioButton(
                                  callback: viewModel.onBrewPressed,
                                  text: CaffeioStrings.startBrewingCoffee,
                                ),
                              ),
                              child: HomeHistoryList(
                                brews: state.userBrews,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: !state.isUserLogged || state.userBrews.isNotEmpty
              ? FloatingActionButton(
                  onPressed: viewModel.onBrewPressed,
                  child: Image.asset(
                    CaffeioAssets.coffeeBeanIcon,
                    width: 26,
                    height: 26,
                  ),
                )
              : null,
        );
      },
    );
  }
}
