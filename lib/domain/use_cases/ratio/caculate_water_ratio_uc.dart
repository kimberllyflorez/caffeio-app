import 'package:caffeio/app/features/brew/ratio/ratio_model.dart';
import 'package:caffeio/domain/use_cases.abs.dart';

class CalculateWaterRatioUseCase extends UseCase<double, RatioModelView> {
  @override
  double call(RatioModelView params) {
    return params.gramsCoffee * params.ratio;
  }
}
