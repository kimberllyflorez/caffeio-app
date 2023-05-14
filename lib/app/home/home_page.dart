import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/home/home_vm.dart';
import 'package:caffeio/app/mvvm/view_state.abs.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home page',
          style: context.theme.typo.title,
        ),
      ),
      body: StreamBuilder<HomePageState>(
        stream: viewModel.state,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: data.brewingMethods.map((e) => Text(e.name)).toList(),
            );
          }
          return Center(
            child: Text(
              'Home page',
              style: context.theme.typo.title,
            ),
          );
        },
      ),
    );
  }
}
