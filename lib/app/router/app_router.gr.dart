// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:caffeio/app/features/auth/login/login_page.dart' as _i2;
import 'package:caffeio/app/features/brew/methods_selection/method_selection_page.dart'
    as _i4;
import 'package:caffeio/app/features/brew/ratio/ratio_model.dart' as _i14;
import 'package:caffeio/app/features/brew/ratio/ratio_page.dart' as _i6;
import 'package:caffeio/app/features/brew/recommendations/recommendations_page.dart'
    as _i7;
import 'package:caffeio/app/features/brew/timer/timer_page.dart' as _i10;
import 'package:caffeio/app/features/home/home_page.dart' as _i1;
import 'package:caffeio/app/features/method/method_page.dart' as _i3;
import 'package:caffeio/app/features/onboarding/onboarding_page.dart' as _i5;
import 'package:caffeio/app/features/settings/settings_page.dart' as _i8;
import 'package:caffeio/app/features/support/support_page.dart' as _i9;
import 'package:caffeio/entities/brew/brewing_method.dart' as _i13;
import 'package:flutter/material.dart' as _i12;

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomePage();
    },
  );
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.LoginPage();
    },
  );
}

/// generated route for
/// [_i3.MethodPage]
class MethodRoute extends _i11.PageRouteInfo<MethodRouteArgs> {
  MethodRoute({
    _i12.Key? key,
    required _i13.BrewingMethod method,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          MethodRoute.name,
          args: MethodRouteArgs(
            key: key,
            method: method,
          ),
          initialChildren: children,
        );

  static const String name = 'MethodRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MethodRouteArgs>();
      return _i3.MethodPage(
        key: args.key,
        method: args.method,
      );
    },
  );
}

class MethodRouteArgs {
  const MethodRouteArgs({
    this.key,
    required this.method,
  });

  final _i12.Key? key;

  final _i13.BrewingMethod method;

  @override
  String toString() {
    return 'MethodRouteArgs{key: $key, method: $method}';
  }
}

/// generated route for
/// [_i4.MethodSelectionPage]
class MethodSelectionRoute extends _i11.PageRouteInfo<void> {
  const MethodSelectionRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MethodSelectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'MethodSelectionRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.MethodSelectionPage();
    },
  );
}

/// generated route for
/// [_i5.OnboardingPage]
class OnboardingRoute extends _i11.PageRouteInfo<void> {
  const OnboardingRoute({List<_i11.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.OnboardingPage();
    },
  );
}

/// generated route for
/// [_i6.RatioPage]
class RatioRoute extends _i11.PageRouteInfo<RatioRouteArgs> {
  RatioRoute({
    _i12.Key? key,
    required _i13.BrewingMethod brewingMethod,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          RatioRoute.name,
          args: RatioRouteArgs(
            key: key,
            brewingMethod: brewingMethod,
          ),
          initialChildren: children,
        );

  static const String name = 'RatioRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RatioRouteArgs>();
      return _i6.RatioPage(
        key: args.key,
        brewingMethod: args.brewingMethod,
      );
    },
  );
}

class RatioRouteArgs {
  const RatioRouteArgs({
    this.key,
    required this.brewingMethod,
  });

  final _i12.Key? key;

  final _i13.BrewingMethod brewingMethod;

  @override
  String toString() {
    return 'RatioRouteArgs{key: $key, brewingMethod: $brewingMethod}';
  }
}

/// generated route for
/// [_i7.RecommendationsPage]
class RecommendationsRoute
    extends _i11.PageRouteInfo<RecommendationsRouteArgs> {
  RecommendationsRoute({
    _i12.Key? key,
    required _i13.BrewingMethod method,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          RecommendationsRoute.name,
          args: RecommendationsRouteArgs(
            key: key,
            method: method,
          ),
          initialChildren: children,
        );

  static const String name = 'RecommendationsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecommendationsRouteArgs>();
      return _i7.RecommendationsPage(
        key: args.key,
        method: args.method,
      );
    },
  );
}

class RecommendationsRouteArgs {
  const RecommendationsRouteArgs({
    this.key,
    required this.method,
  });

  final _i12.Key? key;

  final _i13.BrewingMethod method;

  @override
  String toString() {
    return 'RecommendationsRouteArgs{key: $key, method: $method}';
  }
}

/// generated route for
/// [_i8.SettingsPage]
class SettingsRoute extends _i11.PageRouteInfo<void> {
  const SettingsRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i8.SettingsPage();
    },
  );
}

/// generated route for
/// [_i9.SupportPage]
class SupportRoute extends _i11.PageRouteInfo<void> {
  const SupportRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SupportRoute.name,
          initialChildren: children,
        );

  static const String name = 'SupportRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.SupportPage();
    },
  );
}

/// generated route for
/// [_i10.TimerPage]
class TimerRoute extends _i11.PageRouteInfo<TimerRouteArgs> {
  TimerRoute({
    _i12.Key? key,
    required _i14.RatioModelView ratioMode,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          TimerRoute.name,
          args: TimerRouteArgs(
            key: key,
            ratioMode: ratioMode,
          ),
          initialChildren: children,
        );

  static const String name = 'TimerRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TimerRouteArgs>();
      return _i10.TimerPage(
        key: args.key,
        ratioMode: args.ratioMode,
      );
    },
  );
}

class TimerRouteArgs {
  const TimerRouteArgs({
    this.key,
    required this.ratioMode,
  });

  final _i12.Key? key;

  final _i14.RatioModelView ratioMode;

  @override
  String toString() {
    return 'TimerRouteArgs{key: $key, ratioMode: $ratioMode}';
  }
}
