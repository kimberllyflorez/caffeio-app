import 'package:caffeio/app/features/brew/ratio/ratio_model.dart';
import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:caffeio/domain/use_cases/ratio/caculate_water_ratio_uc.dart';
import 'package:caffeio/entities/brew/brewing_method.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class RatioState extends Equatable {
  final RatioModelView ratioModel;
  final double ratio;

  const RatioState({
    this.ratioModel = const RatioModelView(),
    this.ratio = 16,
  });

  RatioState copyWith({
    RatioModelView? ratioModel,
    double? ratio,
  }) {
    return RatioState(
      ratioModel: ratioModel ?? this.ratioModel,
      ratio: ratio ?? this.ratio,
    );
  }

  @override
  List<Object?> get props => [
        ratio,
        ratioModel,
      ];
}

class RatioViewModel extends ViewModel {
  final CalculateWaterRatioUseCase _calculateWaterRatio;
  final _state = BehaviorSubject<RatioState>.seeded(const RatioState());

  RatioViewModel(this._calculateWaterRatio);

  Stream<RatioState> get state => _state;
  final _router = BehaviorSubject<RouteSpec>();

  Stream<RouteSpec> get router => _router;

  @override
  void init() {}

  void onRatioSliderChange(double ratio) {
    final ratioModel = _state.value.ratioModel.copyWith(ratio: ratio.floor());
    final water = totalWater(ratioModel);
    _state.add(
      _state.value.copyWith(
        ratio: ratio,
        ratioModel: _state.value.ratioModel.copyWith(
          ratio: ratio.floor(),
          water: water,
        ),
      ),
    );
  }

  void saveGramsCoffee(String grams) {
    final double? gramsValue = double.tryParse(grams);
    final water = totalWater(
      _state.value.ratioModel.copyWith(gramsCoffee: gramsValue),
    );
    final newState = _state.value.copyWith(
      ratioModel: _state.value.ratioModel.copyWith(
        gramsCoffee: gramsValue,
        water: water,
      ),
    );
    _state.add(newState);
  }

  int totalWater(RatioModelView ratioModel) {
    return _calculateWaterRatio(ratioModel).floor();
  }

  void nextPage(BrewingMethod method) {
    final ratioModel = _state.value.ratioModel.copyWith(method: method);
    _router.add(RouteSpec.push(route: TimerRoute(ratioMode: ratioModel)));
  }

  @override
  void dispose() {
    _state.close();
  }
}
