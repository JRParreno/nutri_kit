import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/remedy/domain/entities/index.dart';
import 'package:nutri_kit/features/remedy/domain/repository/remedy_repository.dart';

class GetRemedyDetail
    implements UseCase<RemedyDetailEntity, GetRemedyDetailParams> {
  final RemedyRepository remedyRepository;

  const GetRemedyDetail(this.remedyRepository);

  @override
  Future<Either<Failure, RemedyDetailEntity>> call(
      GetRemedyDetailParams params) async {
    return await remedyRepository.getRemedyDetail(params.id);
  }
}

class GetRemedyDetailParams {
  final String id;
  const GetRemedyDetailParams(this.id);
}
