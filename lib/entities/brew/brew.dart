import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brew.g.dart';

@JsonSerializable()
class Brew extends Equatable {
  final int? id;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'method_id')
  final int methodId;
  final int ratio;
  final int water;
  @JsonKey(name: 'coffee_grams')
  final int coffeeGrams;
  @JsonKey(name: 'user_id')
  final String userId;

  const Brew({
    this.id,
    this.createdAt,
    required this.methodId,
    required this.ratio,
    required this.water,
    required this.coffeeGrams,
    required this.userId,
  });

  factory Brew.fromJson(Map<String, dynamic> json) => _$BrewFromJson(json);

  Map<String, dynamic> toJson() => _$BrewToJson(this);

  @override
  List<Object?> get props => [
        id,
        createdAt,
        methodId,
        ratio,
        water,
        coffeeGrams,
        userId,
      ];
}
