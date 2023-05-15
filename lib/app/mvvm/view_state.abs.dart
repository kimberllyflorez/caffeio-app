import 'package:auto_route/auto_route.dart';
import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:caffeio/app/di/di.dart';
import 'package:flutter/material.dart';

abstract class ViewState<T extends StatefulWidget, V extends ViewModel>
    extends State<T> {
  late final V _viewModel;

  V get viewModel => _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = locator.get<V>();
  }

  void listenToNavigation(Stream<RouteSpec> stream) {
    stream.listen((routeInfo) {
      debugPrint(
          'Navigation Action: ${routeInfo.action} route: ${routeInfo.routes}');
      debugPrint('Current stack ${context.router.stack}');
      switch (routeInfo.action) {
        case RouteAction.push:
          context.router.push(routeInfo.routes.first);
          break;
        case RouteAction.replaceAllWithOne:
          context.router.replaceAll([routeInfo.routes.first]);
          break;
        case RouteAction.replaceAllWithMany:
          context.router.replaceAll(routeInfo.routes);
          break;
        case RouteAction.pop:
          context.router.pop();
          break;
        case RouteAction.popForced:
          context.router.popForced();
          break;
        case RouteAction.popAndPush:
          context.router.popAndPush(routeInfo.routes.first);
          break;
      }
    });
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
