import 'package:caffeio/app/mvvm/view_model.abs.dart';
import 'package:caffeio/app/router/app_router.gr.dart';
import 'package:caffeio/app/router/route_spec.dart';

import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

class RatioState extends Equatable {
  final double ratio;
  final String ratioLabel;

  const RatioState({
    this.ratio = 1.6,
    this.ratioLabel = "1:16",
  });

  RatioState copyWith({
    double? ratio,
    String? ratioLabel,
  }) {
    return RatioState(
      ratioLabel: ratioLabel ?? this.ratioLabel,
      ratio: ratio ?? this.ratio,
    );
  }

  @override
  List<Object?> get props => [ratio, ratioLabel];
}

class RatioViewModel extends ViewModel {
  final _state = BehaviorSubject<RatioState>.seeded(const RatioState());

  Stream<RatioState> get state => _state;
  final _router = BehaviorSubject<RouteSpec>();

  Stream<RouteSpec> get router => _router;

  @override
  void init() {

  }

  void saveRatio(double index) {
    _state.add(RatioState(ratio: index, ratioLabel: "1: ${index.toInt().toString()}"));
  }



  void nextPage() {
    _router.add(RouteSpec.push(route: const RecommendationsRoute()));
  }

  @override
  void dispose() {
    _state.close();
  }
}
