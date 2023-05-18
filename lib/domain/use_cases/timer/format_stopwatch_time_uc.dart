import 'package:caffeio/domain/use_cases.abs.dart';

class FormatStopwatchTimeUseCase extends UseCase<String, Duration> {
  @override
  String call(Duration params) {
    final minutes = _twoDigits(params.inMinutes.remainder(60));
    final seconds = _twoDigits(params.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  String _twoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }
}
