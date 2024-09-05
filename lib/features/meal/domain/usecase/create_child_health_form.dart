import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/meal/domain/entities/index.dart';
import 'package:nutri_kit/features/meal/domain/repository/meal_repository.dart';

class CreateChildHealthForm
    implements
        UseCase<UserMealPlanCreationEntity, CreateChildHealthFormParams> {
  final MealRepository mealRepository;

  const CreateChildHealthForm(this.mealRepository);

  @override
  Future<Either<Failure, UserMealPlanCreationEntity>> call(
      CreateChildHealthFormParams params) async {
    return await mealRepository.createChildHealthForm(
      birthdate: params.birthdate,
      gender: params.gender,
      height: params.height,
      weight: params.weight,
      name: params.name,
    );
  }
}

class CreateChildHealthFormParams {
  final String name;
  final String weight;
  final String height;
  final String birthdate;
  final String gender;

  CreateChildHealthFormParams({
    required this.name,
    required this.weight,
    required this.height,
    required this.birthdate,
    required this.gender,
  });
}
