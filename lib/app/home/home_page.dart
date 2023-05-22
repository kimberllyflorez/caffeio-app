import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/home/home_vm.dart';
import 'package:caffeio/app/home/widgets/home_history_list_wd.dart';
import 'package:caffeio/app/home/widgets/home_methods_list_wd.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
import 'package:caffeio/design_system/atoms/container/caffeio_bottom_container.dart';
import 'package:caffeio/design_system/atoms/loading/loading_indicator.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
            iconTheme:
                Theme.of(context).iconTheme.copyWith(color: Colors.white),
            title: Text(
              'Home page',
              style: theme.typo.subtitle.copyWith(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            actions: [
              Visibility(
                visible: state.isUserLogged,
                child: IconButton(
                  onPressed: viewModel.onUserPressed,
                  icon: const Icon(Icons.account_circle_outlined),
                ),
              )
            ],
          ),
          body: Visibility(
            visible: !state.loading,
            replacement: const LoadingIndicator(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: theme.spacing.xs),
                Padding(
                  padding: theme.insets.xs.toLRB,
                  child: Text(
                    'Meet the methods',
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
                SizedBox(height: theme.spacing.s),
                Expanded(
                  child: CaffeioBottomContainer(
                    backgroundColor: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: theme.spacing.s),
                        Padding(
                          padding: theme.insets.xs.toLRB,
                          child: Text(
                            'Brewing history',
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
                                child: const Text(
                                  'LogIn to start recording your brews',
                                ),
                              ),
                            ),
                            child: Visibility(
                              visible: state.userBrews.isNotEmpty,
                              replacement: Center(
                                child: CaffeioButton(
                                  callback: viewModel.onBrewPressed,
                                  text: "Let's start make some coffee",
                                ),
                              ),
                              child: HomeHistoryList(
                                userBrewsByDate: state.userBrews,
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
          floatingActionButton: Visibility(
            visible: !state.isUserLogged || state.userBrews.isNotEmpty,
            child: FloatingActionButton(
              onPressed: viewModel.onBrewPressed,
              child: Image.asset(
                'assets/images/coffee-bean-icon.png',
                width: 26,
                height: 26,
              ),
            ),
          ),
        );
      },
    );
  }
}
