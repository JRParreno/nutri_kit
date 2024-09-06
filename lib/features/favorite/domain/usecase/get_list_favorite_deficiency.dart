import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/favorite/domain/repository/favorite_repository.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

class GetListFavoriteDeficiency
    implements UseCase<DeficiencySearchResponseEntity, ListParams> {
  final FavoriteRepository favoriteRepository;

  const GetListFavoriteDeficiency(this.favoriteRepository);

  @override
  Future<Either<Failure, DeficiencySearchResponseEntity>> call(
      ListParams params) async {
    return await favoriteRepository.getListFavoriteDeficiency(
      next: params.next,
      previous: params.previous,
    );
  }
}
