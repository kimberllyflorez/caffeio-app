import 'package:auto_route/auto_route.dart';
import 'package:caffeio/di/di.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/fetch_brewing_methods_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/get_brewing_methods_uc.dart';
import 'package:caffeio/entities/brewing_methods/brewing_method.dart';
import 'package:caffeio/design_system/design_system.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    locator.get<FetchBrewingMethodsUseCase>().fetchBrewingMethods();
    final stream = locator.get<GetBrewingMethodsUseCase>().brewingMethods;
    return Scaffold(
      body: StreamBuilder<List<BrewingMethod>>(
        stream: stream,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: data.map((e) => Text(e.name)).toList(),
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
