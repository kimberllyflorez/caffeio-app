// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:caffeio/app/auth/login/login_page.dart' as _i3;
import 'package:caffeio/app/brew/methods_selection/method_selection_page.dart'
    as _i5;
import 'package:caffeio/app/brew/ratio/ratio_model.dart' as _i13;
import 'package:caffeio/app/brew/ratio/ratio_page.dart' as _i6;
import 'package:caffeio/app/brew/recommendations/recommendations_page.dart'
    as _i4;
import 'package:caffeio/app/brew/timer/timer_page.dart' as _i7;
import 'package:caffeio/app/home/home_page.dart' as _i2;
import 'package:caffeio/app/method/method_page.dart' as _i1;
import 'package:caffeio/app/onboarding/onboarding_page.dart' as _i9;
import 'package:caffeio/app/settings/settings_page.dart' as _i8;
import 'package:caffeio/entities/brew/brewing_method.dart' as _i12;
import 'package:flutter/material.dart' as _i11;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    MethodRoute.name: (routeData) {
      final args = routeData.argsAs<MethodRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.MethodPage(
          key: args.key,
          method: args.method,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    RecommendationsRoute.name: (routeData) {
      final args = routeData.argsAs<RecommendationsRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.RecommendationsPage(
          key: args.key,
          method: args.method,
        ),
      );
    },
    MethodSelectionRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.MethodSelectionPage(),
      );
    },
    RatioRoute.name: (routeData) {
      final args = routeData.argsAs<RatioRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.RatioPage(
          key: args.key,
          brewingMethod: args.brewingMethod,
        ),
      );
    },
    TimerRoute.name: (routeData) {
      final args = routeData.argsAs<TimerRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.TimerPage(
          key: args.key,
          ratioMode: args.ratioMode,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SettingsPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.OnboardingPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.MethodPage]
class MethodRoute extends _i10.PageRouteInfo<MethodRouteArgs> {
  MethodRoute({
    _i11.Key? key,
    required _i12.BrewingMethod method,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          MethodRoute.name,
          args: MethodRouteArgs(
            key: key,
            method: method,
          ),
          initialChildren: children,
        );

  static const String name = 'MethodRoute';

  static const _i10.PageInfo<MethodRouteArgs> page =
      _i10.PageInfo<MethodRouteArgs>(name);
}

class MethodRouteArgs {
  const MethodRouteArgs({
    this.key,
    required this.method,
  });

  final _i11.Key? key;

  final _i12.BrewingMethod method;

  @override
  String toString() {
    return 'MethodRouteArgs{key: $key, method: $method}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i10.PageRouteInfo<void> {
  const LoginRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RecommendationsPage]
class RecommendationsRoute
    extends _i10.PageRouteInfo<RecommendationsRouteArgs> {
  RecommendationsRoute({
    _i11.Key? key,
    required _i12.BrewingMethod method,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          RecommendationsRoute.name,
          args: RecommendationsRouteArgs(
            key: key,
            method: method,
          ),
          initialChildren: children,
        );

  static const String name = 'RecommendationsRoute';

  static const _i10.PageInfo<RecommendationsRouteArgs> page =
      _i10.PageInfo<RecommendationsRouteArgs>(name);
}

class RecommendationsRouteArgs {
  const RecommendationsRouteArgs({
    this.key,
    required this.method,
  });

  final _i11.Key? key;

  final _i12.BrewingMethod method;

  @override
  String toString() {
    return 'RecommendationsRouteArgs{key: $key, method: $method}';
  }
}

/// generated route for
/// [_i5.MethodSelectionPage]
class MethodSelectionRoute extends _i10.PageRouteInfo<void> {
  const MethodSelectionRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MethodSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'MethodSelectionRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RatioPage]
class RatioRoute extends _i10.PageRouteInfo<RatioRouteArgs> {
  RatioRoute({
    _i11.Key? key,
    required _i12.BrewingMethod brewingMethod,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          RatioRoute.name,
          args: RatioRouteArgs(
            key: key,
            brewingMethod: brewingMethod,
          ),
          initialChildren: children,
        );

  static const String name = 'RatioRoute';

  static const _i10.PageInfo<RatioRouteArgs> page =
      _i10.PageInfo<RatioRouteArgs>(name);
}

class RatioRouteArgs {
  const RatioRouteArgs({
    this.key,
    required this.brewingMethod,
  });

  final _i11.Key? key;

  final _i12.BrewingMethod brewingMethod;

  @override
  String toString() {
    return 'RatioRouteArgs{key: $key, brewingMethod: $brewingMethod}';
  }
}

/// generated route for
/// [_i7.TimerPage]
class TimerRoute extends _i10.PageRouteInfo<TimerRouteArgs> {
  TimerRoute({
    _i11.Key? key,
    required _i13.RatioModelView ratioMode,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          TimerRoute.name,
          args: TimerRouteArgs(
            key: key,
            ratioMode: ratioMode,
          ),
          initialChildren: children,
        );

  static const String name = 'TimerRoute';

  static const _i10.PageInfo<TimerRouteArgs> page =
      _i10.PageInfo<TimerRouteArgs>(name);
}

class TimerRouteArgs {
  const TimerRouteArgs({
    this.key,
    required this.ratioMode,
  });

  final _i11.Key? key;

  final _i13.RatioModelView ratioMode;

  @override
  String toString() {
    return 'TimerRouteArgs{key: $key, ratioMode: $ratioMode}';
  }
}

/// generated route for
/// [_i8.SettingsPage]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OnboardingPage]
class OnboardingRoute extends _i10.PageRouteInfo<void> {
  const OnboardingRoute({List<_i10.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
