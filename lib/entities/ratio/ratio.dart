import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ratio.g.dart';

@JsonSerializable(createToJson: false)
class Ratio extends Equatable {
  final double ratio;
  final double gramsCoffee;
  final double water;

  const Ratio({
    required this.water,
    required this.gramsCoffee,
    required this.ratio,
  });

  factory Ratio.fromJson(Map<String, dynamic> json) =>
      _$RatioFromJson(json);

  @override
  List<Object?> get props => [
    ratio,
    gramsCoffee,
    water,
  ];
}
