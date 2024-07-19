import 'package:caffeio/app/features/brew/ratio/ratio_model.dart';
import 'package:caffeio/app/features/home/model/brew_by_date.dart';
import 'package:caffeio/domain/use_cases.abs.dart';
import 'package:intl/intl.dart';

class GetBrewsByDateUseCase extends UseCase<List<BrewByDate>, List<RatioModelView>> {
  //TODO: Improve logic
  @override
  List<BrewByDate> call(List<RatioModelView> params) {
    Map<String, List<RatioModelView>> groupedMethods = {};
    Map<String, double> totalGrams = {};

    params.sort(
        (a, b) => a.creationDate?.microsecondsSinceEpoch ?? 0.compareTo(b.creationDate?.millisecondsSinceEpoch ?? 0));

    for (var brew in params) {
      final String date = DateFormat('MMMMd').format(
        brew.creationDate ?? DateTime.now(),
      );
      double grams = brew.gramsCoffee;

      if (!groupedMethods.containsKey(date)) {
        groupedMethods[date] = [];
        totalGrams[date] = 0;
      }

      groupedMethods[date]!.add(brew);
      totalGrams[date] = (totalGrams[date] ?? 0) + grams;
    }

    List<BrewByDate> result = [];

    groupedMethods.forEach((date, methods) {
      double total = totalGrams[date]!;
      result.add(BrewByDate(date, methods, total));
    });

    return result;
  }
}
