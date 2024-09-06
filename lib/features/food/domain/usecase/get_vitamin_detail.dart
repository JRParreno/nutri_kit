import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/food/domain/entities/index.dart';
import 'package:nutri_kit/features/food/domain/repository/food_repository.dart';

class GetVitaminDetail
    implements UseCase<VitaminEntity, GetVitaminDetailParams> {
  final FoodRepository foodRepository;

  const GetVitaminDetail(this.foodRepository);

  @override
  Future<Either<Failure, VitaminEntity>> call(
      GetVitaminDetailParams params) async {
    return await foodRepository.getVitaminDetail(params.id);
  }
}

class GetVitaminDetailParams {
  final String id;
  const GetVitaminDetailParams(this.id);
}
