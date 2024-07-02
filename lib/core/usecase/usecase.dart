import 'package:nutri_kit/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessfulType, Params> {
  Future<Either<Failure, SuccessfulType>> call(Params params);
}

class NoParams {}
