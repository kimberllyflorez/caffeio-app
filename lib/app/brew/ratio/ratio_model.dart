import 'package:caffeio/entities/brew/brewing_method.dart';
import 'package:equatable/equatable.dart';

class RatioModelView extends Equatable {
  final int ratio;
  final double gramsCoffee;
  final int water;
  final BrewingMethod method;

  const RatioModelView({
    this.water = 200,
    this.gramsCoffee = 20,
    this.ratio = 16,
    this.method = const BrewingMethod(
      id: 0,
      name: '',
      description: '',
      image: '',
      history: '',
    ),
  });

  RatioModelView copyWith({
    int? water,
    int? ratio,
    double? gramsCoffee,
    BrewingMethod? method,
  }) {
    return RatioModelView(
      method: method ?? this.method,
      gramsCoffee: gramsCoffee ?? this.gramsCoffee,
      ratio: ratio ?? this.ratio,
      water: water ?? this.water,
    );
  }

  @override
  List<Object?> get props => [
        ratio,
        gramsCoffee,
        water,
        method,
      ];
}
