// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:caffeio/app/auth/login/login_page.dart' as _i7;
import 'package:caffeio/app/brew/method_selection_page.dart' as _i3;
import 'package:caffeio/app/brew/ratio_page.dart' as _i4;
import 'package:caffeio/app/brew/recommendations_page.dart' as _i5;
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:caffeio/app/auth/login_page.dart' as _i3;
import 'package:caffeio/app/brew/method_selection_page.dart' as _i4;
import 'package:caffeio/app/brew/ratio_page.dart' as _i5;
import 'package:caffeio/app/brew/recommendations_page.dart' as _i6;
import 'package:caffeio/app/brew/timer_page.dart' as _i8;
import 'package:caffeio/app/home/home_page.dart' as _i2;
import 'package:caffeio/app/method/method_page.dart' as _i1;
import 'package:caffeio/app/settings/settings_page.dart' as _i7;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    MethodRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.MethodPage(),
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
    MethodSelectionRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MethodSelectionPage(),
      );
    },
    RatioRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RatioPage(),
      );
    },
    RecommendationsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RecommendationsPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SettingsPage(),
      );
    },
    TimerRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.TimerPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.MethodPage]
class MethodRoute extends _i9.PageRouteInfo<void> {
  const MethodRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MethodRoute.name,
          initialChildren: children,
        );

  static const String name = 'MethodRoute';

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
/// [_i4.MethodSelectionPage]
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
/// [_i5.RatioPage]
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
/// [_i6.RecommendationsPage]
class RecommendationsRoute extends _i9.PageRouteInfo<void> {
  const RecommendationsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RecommendationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'RecommendationsRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SettingsPage]
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
/// [_i8.TimerPage]
class TimerRoute extends _i9.PageRouteInfo<void> {
  const TimerRoute({List<_i9.PageRouteInfo>? children})
      : super(
          TimerRoute.name,
          initialChildren: children,
        );

  static const String name = 'TimerRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
