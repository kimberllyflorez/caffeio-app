import 'package:equatable/equatable.dart';

class RatioModelView extends Equatable {
  final int ratio;
  final double gramsCoffee;
  final int water;

  const RatioModelView({
    this.water = 200,
    this.gramsCoffee = 20,
    this.ratio = 16,
  });

  RatioModelView copyWith({
    int? water,
    int? ratio,
    double? gramsCoffee,
  }) {
    return RatioModelView(
        gramsCoffee: gramsCoffee ?? this.gramsCoffee,
        ratio: ratio ?? this.ratio,
        water: water ?? this.water);
  }

  @override
  List<Object?> get props => [
        ratio,
        gramsCoffee,
        water,
      ];
}
