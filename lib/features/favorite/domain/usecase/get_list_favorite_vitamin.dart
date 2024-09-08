import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/core/usecase/usecase.dart';
import 'package:nutri_kit/features/favorite/domain/repository/favorite_repository.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

class GetListFavoriteVitamin
    implements UseCase<VitaminResponseEntity, ListParams> {
  final FavoriteRepository favoriteRepository;

  const GetListFavoriteVitamin(this.favoriteRepository);

  @override
  Future<Either<Failure, VitaminResponseEntity>> call(ListParams params) async {
    return await favoriteRepository.getListFavoriteVitamin(
      next: params.next,
      previous: params.previous,
    );
  }
}
