import 'package:caffeio/app/brew/ratio/ratio_model.dart';
import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';
import 'package:caffeio/domain/use_cases/ratio/ratio_calculate_water.dart';

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
    String? ratioLabel,
  }) {
    return RatioState(
      ratioModel: ratioModel ?? this.ratioModel,
      ratio: ratio ?? this.ratio,
    );
  }

  @override
  List<Object?> get props => [ratio, ratioModel];
}

class RatioViewModel extends ViewModel {
  final RatioCalculateWater _water;
  final _state = BehaviorSubject<RatioState>.seeded(const RatioState());

  RatioViewModel(this._water);

  Stream<RatioState> get state => _state;
  final _router = BehaviorSubject<RouteSpec>();

  Stream<RouteSpec> get router => _router;

  @override
  void init() {}

  void saveRatio(double ratio) {
    _state.add(
      RatioState(
          ratio: ratio,
          ratioModel: _state.value.ratioModel.copyWith(ratio: ratio.floor())),
    );
  }

  void saveGramsCoffee(String grams) {
    final double? gramsValue = double.tryParse(grams);
    _state.add(RatioState(
        ratioModel: _state.value.ratioModel.copyWith(gramsCoffee: gramsValue)));
  }

  String totalWater() {
    final data = _state.value.ratioModel;
    return _water(data).floor().toString();
  }

  void nextPage() {
    _router.add(RouteSpec.push(route: const RecommendationsRoute()));
  }

  @override
  void dispose() {
    _state.close();
  }
}
