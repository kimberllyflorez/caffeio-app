import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';

part 'brew.mapper.dart';

@MappableClass()
class Brew extends Equatable with BrewMappable {
  final int? id;
  @MappableField(key: 'created_at')
  final DateTime? createdAt;
  @MappableField(key: 'method_id')
  final int methodId;
  final int ratio;
  final int water;
  @MappableField(key: 'coffee_grams')
  final int coffeeGrams;
  @MappableField(key: 'user_id')
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
