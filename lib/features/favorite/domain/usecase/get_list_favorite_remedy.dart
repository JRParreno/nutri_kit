import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/favorite/domain/repository/favorite_repository.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

class GetListFavoriteRemedy
    implements UseCase<RemediesResponseEntity, ListParams> {
  final FavoriteRepository favoriteRepository;

  const GetListFavoriteRemedy(this.favoriteRepository);

  @override
  Future<Either<Failure, RemediesResponseEntity>> call(
      ListParams params) async {
    return await favoriteRepository.getListFavoriteRemedy(
      next: params.next,
      previous: params.previous,
    );
  }
}
