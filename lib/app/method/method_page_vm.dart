import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:rxdart/rxdart.dart';

class MethodPageViewModel extends ViewModel {
  final _router = BehaviorSubject<RouteSpec>();

  Stream<RouteSpec> get router => _router;

  MethodPageViewModel();

  @override
  void init() {}

  void onBrewButtonPressed(int id) {
    _router.add(RouteSpec.push(route: RecommendationsRoute(id: id)));
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
