import 'package:appetec/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

abstract interface class UseCaseNoParams<SuccessType> {
  Future<Either<Failure, SuccessType>> call();
}
