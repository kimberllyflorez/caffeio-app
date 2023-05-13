import 'package:auto_route/auto_route.dart';

enum RouteAction {
  push,
  replaceAllWithOne,
  replaceAllWithMany,
  popAndPush,
  pop,
  popForced,
}

class RouteSpec {
  final RouteAction action;
  final List<PageRouteInfo> routes;

  RouteSpec.push({required PageRouteInfo route})
      : action = RouteAction.push,
        routes = [route];

  RouteSpec.replaceAllWithOne({required PageRouteInfo route})
      : action = RouteAction.replaceAllWithOne,
        routes = [route];

  const RouteSpec.replaceAllWithMany({required this.routes})
      : action = RouteAction.replaceAllWithMany;

  RouteSpec.popAndPush({required PageRouteInfo route})
      : action = RouteAction.popAndPush,
        routes = [route];

  RouteSpec.pop()
      : action = RouteAction.pop,
        routes = [];

  RouteSpec.popForced()
      : action = RouteAction.popForced,
        routes = [];
}
