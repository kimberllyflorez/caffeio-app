import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';

part 'brewing_method.mapper.dart';

@MappableClass()
class BrewingMethod extends Equatable with BrewingMethodMappable {
  final int id;
  final String name;
  final String description;
  final String image;
  final String history;

  const BrewingMethod({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.history,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        image,
        history,
      ];
}
