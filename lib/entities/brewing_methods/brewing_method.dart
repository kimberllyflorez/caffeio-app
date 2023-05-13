import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brewing_method.g.dart';

@JsonSerializable(createToJson: false)
class BrewingMethod extends Equatable {
  final int id;
  final String name;
  final String description;

  const BrewingMethod({
    required this.id,
    required this.name,
    required this.description,
  });

  factory BrewingMethod.fromJson(Map<String, dynamic> json) => _$BrewingMethodFromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
        description,
      ];
}
