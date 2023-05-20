import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/fetch_brewing_methods_uc.dart';
import 'package:caffeio/domain/use_cases/brewing_methods/get_brewing_methods_uc.dart';
import 'package:caffeio/entities/brew/brewing_method.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class MethodSelectionState extends Equatable {
  final int pageSelection;
  final List<BrewingMethod> brewingMethods;

  const MethodSelectionState({
    this.pageSelection = 0,
    this.brewingMethods = const [],
  });

  MethodSelectionState copyWith({
    int? pageSelection,
    List<BrewingMethod>? brewingMethods,
  }) {
    return MethodSelectionState(
      pageSelection: pageSelection ?? this.pageSelection,
      brewingMethods: brewingMethods ?? this.brewingMethods,
    );
  }

  @override
  List<Object?> get props => [
        pageSelection,
        brewingMethods,
      ];
}

class MethodSelectionViewModel extends ViewModel {
  final FetchBrewingMethodsUseCase _fetchBrewingMethodsUseCase;
  final GetBrewingMethodsUseCase _getBrewingMethodsUseCase;

  final _subscription = CompositeSubscription();
  final _state = BehaviorSubject<MethodSelectionState>.seeded(
    const MethodSelectionState(),
  );

  MethodSelectionViewModel(
    this._getBrewingMethodsUseCase,
    this._fetchBrewingMethodsUseCase,
  );

  Stream<MethodSelectionState> get state => _state;
  final _router = BehaviorSubject<RouteSpec>();

  Stream<RouteSpec> get router => _router;

  @override
  Future<void> init() async {
    await _fetchBrewingMethodsUseCase();
    _subscription.add(_getBrewingMethodsUseCase().listen((event) {
      _state.add(_state.value.copyWith(brewingMethods: event));
    }));
  }

  void onChangePageView(int index) {
    _state.add(_state.value.copyWith(pageSelection: index));
  }

  void onNextPressed() {
    final methodSelected =
        _state.value.brewingMethods[_state.value.pageSelection];
    _router.add(
        RouteSpec.push(route: RecommendationsRoute(id: methodSelected.id)));
  }

  @override
  void dispose() {
    _subscription.cancel();
    _state.close();
  }
}
