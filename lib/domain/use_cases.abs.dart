abstract class UseCase<T, Params> {
  T call(Params params);
}

abstract class NoParamsUseCase<T> {
  T call();
}

abstract class VoidUseCase<Params> {
  void call(Params params);
}

abstract class NoParamsVoidUseCase {
  void call();
}

abstract class StreamUseCase<T, Params> {
  Stream<T> call(Params params);
}

abstract class NoParamsStreamUseCase<T> {
  Stream<T> call();
}

abstract class FutureUseCase<T, Params> {
  Future<T> call(Params params);
}

abstract class NoParamsFutureUseCase<T> {
  Future<T> call();
}
