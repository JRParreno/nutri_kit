import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/deficiency/domain/entities/index.dart';
import 'package:nutri_kit/features/deficiency/domain/repository/deficiency_repository.dart';

class GetDeficiencyDetail
    implements UseCase<DeficiencyDetailEntity, GetDeficiencyDetailParams> {
  final DeficiencyRepository deficiencyRepository;

  const GetDeficiencyDetail(this.deficiencyRepository);

  @override
  Future<Either<Failure, DeficiencyDetailEntity>> call(
      GetDeficiencyDetailParams params) async {
    return await deficiencyRepository.getDeficiencyDetail(params.id);
  }
}

class GetDeficiencyDetailParams {
  final String id;

  const GetDeficiencyDetailParams(this.id);
}
