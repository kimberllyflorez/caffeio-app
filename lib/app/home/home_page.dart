import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/home/home_vm.dart';
import 'package:caffeio/app/home/widgets/home_history_list_wd.dart';
import 'package:caffeio/app/home/widgets/home_methods_list_wd.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
import 'package:caffeio/design_system/atoms/buttons/caffeio_button.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home page',
          style: context.theme.typo.title,
        ),
        actions: [
          IconButton(
            onPressed: viewModel.onUserPressed,
            icon: const Icon(Icons.warehouse_rounded),
          )
        ],
      ),
      body: StreamBuilder<HomePageState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          final state = snapshot.data;
          if (state == null || state.loading) {
            return const LoadingIndicator();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: theme.spacing.xs),
              Padding(
                padding: theme.insets.xs.toLRB,
                child: Text(
                  'Meet the methods',
                  style: context.theme.typo.subtitle,
                  textAlign: TextAlign.start,
                ),
              ),
              HomeMethodsList(methods: state.brewingMethods),
              SizedBox(height: theme.spacing.s),
              Padding(
                padding: theme.insets.xs.toLRB,
                child: Text(
                  'Brewing history',
                  style: context.theme.typo.subtitle,
                  textAlign: TextAlign.start,
                ),
              ),
              Visibility(
                visible: state.isUserLogged,
                replacement: Center(
                  child: CaffeioButton(
                    callback: viewModel.onLoginPressed,
                    text: 'Login',
                  ),
                ),
                child: HomeHistoryList(history: state.history),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: viewModel.onBrewPressed,
        child: const Icon(
          Icons.cloud_upload,
        ),
      ),
    );
  }
}
