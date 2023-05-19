import 'package:caffeio/app/brew/ratio/ratio_model.dart';
import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:caffeio/domain/use_cases/ratio/caculate_water_ratio_uc.dart';

import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class RatioState extends Equatable {
  final RatioModelView ratioModel;
  final double ratio;
  final int totalWater;

  const RatioState({
    this.ratioModel = const RatioModelView(),
    this.ratio = 16,
    this.totalWater = 320,
  });

  RatioState copyWith({
    RatioModelView? ratioModel,
    double? ratio,
    int? totalWater,
  }) {
    return RatioState(
      ratioModel: ratioModel ?? this.ratioModel,
      ratio: ratio ?? this.ratio,
      totalWater: totalWater ?? this.totalWater,
    );
  }

  @override
  List<Object?> get props => [
        ratio,
        ratioModel,
        totalWater,
      ];
}

class RatioViewModel extends ViewModel {
  final CalculateWaterRatioUseCase _water;
  final _state = BehaviorSubject<RatioState>.seeded(const RatioState());

  RatioViewModel(this._water);

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
        ratioModel: _state.value.ratioModel.copyWith(ratio: ratio.floor()),
        totalWater: water,
      ),
    );
  }

  void saveGramsCoffee(String grams) {
    final double? gramsValue = double.tryParse(grams);
    _state.add(
      RatioState(
        ratioModel: _state.value.ratioModel.copyWith(gramsCoffee: gramsValue),
      ),
    );
  }

  int totalWater(RatioModelView ratioModel) {
    return _water(ratioModel).floor();
  }

  void nextPage() {
    _router.add(RouteSpec.push(route: const TimerRoute()));
  }

  @override
  void dispose() {
    _state.close();
  }
}
