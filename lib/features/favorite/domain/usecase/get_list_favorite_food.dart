import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/favorite/domain/repository/favorite_repository.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

class GetListFavoriteFood implements UseCase<FoodResponseEntity, ListParams> {
  final FavoriteRepository favoriteRepository;

  const GetListFavoriteFood(this.favoriteRepository);

  @override
  Future<Either<Failure, FoodResponseEntity>> call(ListParams params) async {
    return await favoriteRepository.getListFavoriteFood(
      next: params.next,
      previous: params.previous,
    );
  }
}
