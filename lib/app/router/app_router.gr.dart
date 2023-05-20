// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:caffeio/app/auth/login/login_page.dart' as _i3;
import 'package:caffeio/app/brew/methods_selection/method_selection_page.dart'
    as _i7;
import 'package:caffeio/app/brew/ratio/ratio_page.dart' as _i6;
import 'package:caffeio/app/brew/recommendations/recommendations_page.dart'
    as _i5;
import 'package:caffeio/app/brew/timer/timer_page.dart' as _i4;
import 'package:caffeio/app/home/home_page.dart' as _i2;
import 'package:caffeio/app/method/method_page.dart' as _i8;
import 'package:caffeio/app/settings/settings_page.dart' as _i1;
import 'package:caffeio/entities/brew/brewing_method.dart' as _i11;
import 'package:flutter/material.dart' as _i10;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SettingsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SettingsPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    TimerRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.TimerPage(),
      );
    },
    RecommendationsRoute.name: (routeData) {
      final args = routeData.argsAs<RecommendationsRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.RecommendationsPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
    RatioRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RatioPage(),
      );
    },
    MethodSelectionRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MethodSelectionPage(),
      );
    },
    MethodRoute.name: (routeData) {
      final args = routeData.argsAs<MethodRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.MethodPage(
          key: args.key,
          method: args.method,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.SettingsPage]
class SettingsRoute extends _i9.PageRouteInfo<void> {
  const SettingsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.TimerPage]
class TimerRoute extends _i9.PageRouteInfo<void> {
  const TimerRoute({List<_i9.PageRouteInfo>? children})
      : super(
          TimerRoute.name,
          initialChildren: children,
        );

  static const String name = 'TimerRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RecommendationsPage]
class RecommendationsRoute extends _i9.PageRouteInfo<RecommendationsRouteArgs> {
  RecommendationsRoute({
    _i10.Key? key,
    required int id,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          RecommendationsRoute.name,
          args: RecommendationsRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'RecommendationsRoute';

  static const _i9.PageInfo<RecommendationsRouteArgs> page =
      _i9.PageInfo<RecommendationsRouteArgs>(name);
}

class RecommendationsRouteArgs {
  const RecommendationsRouteArgs({
    this.key,
    required this.id,
  });

  final _i10.Key? key;

  final int id;

  @override
  String toString() {
    return 'RecommendationsRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.RatioPage]
class RatioRoute extends _i9.PageRouteInfo<void> {
  const RatioRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RatioRoute.name,
          initialChildren: children,
        );

  static const String name = 'RatioRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.MethodSelectionPage]
class MethodSelectionRoute extends _i9.PageRouteInfo<void> {
  const MethodSelectionRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MethodSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'MethodSelectionRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MethodPage]
class MethodRoute extends _i9.PageRouteInfo<MethodRouteArgs> {
  MethodRoute({
    _i10.Key? key,
    required _i11.BrewingMethod method,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          MethodRoute.name,
          args: MethodRouteArgs(
            key: key,
            method: method,
          ),
          initialChildren: children,
        );

  static const String name = 'MethodRoute';

  static const _i9.PageInfo<MethodRouteArgs> page =
      _i9.PageInfo<MethodRouteArgs>(name);
}

class MethodRouteArgs {
  const MethodRouteArgs({
    this.key,
    required this.method,
  });

  final _i10.Key? key;

  final _i11.BrewingMethod method;

  @override
  String toString() {
    return 'MethodRouteArgs{key: $key, method: $method}';
  }
}
