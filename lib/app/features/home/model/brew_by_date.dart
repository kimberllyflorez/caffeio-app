import 'package:caffeio/app/features/brew/ratio/ratio_model.dart';
import 'package:equatable/equatable.dart';

class BrewByDate extends Equatable {
  final String brewByDate;
  final List<RatioModelView> items;
  final double total;

  const BrewByDate(
    this.brewByDate,
    this.items,
    this.total,
  );

  @override
  List<Object> get props => [
        brewByDate,
        items,
        total,
      ];
}
