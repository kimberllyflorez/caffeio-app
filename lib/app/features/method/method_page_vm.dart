import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:caffeio/entities/brew/brewing_method.dart';
import 'package:rxdart/rxdart.dart';

class MethodPageViewModel extends ViewModel {
  final _router = BehaviorSubject<RouteSpec>();

  Stream<RouteSpec> get router => _router;

  MethodPageViewModel();

  @override
  void init() {}

  void onBrewButtonPressed(BrewingMethod method) {
    _router.add(RouteSpec.push(route: RecommendationsRoute(method: method)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
