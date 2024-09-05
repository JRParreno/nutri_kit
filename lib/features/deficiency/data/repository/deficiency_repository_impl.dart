import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/deficiency/data/datasources/deficiency_remote_data_source.dart';
import 'package:nutri_kit/features/deficiency/domain/entities/deficiency_detail_entity.dart';
import 'package:nutri_kit/features/deficiency/domain/repository/deficiency_repository.dart';

class DeficiencyRepositoryImpl implements DeficiencyRepository {
  final DeficiencyRemoteDataSource deficiencyRemoteDataSource;

  const DeficiencyRepositoryImpl(this.deficiencyRemoteDataSource);

  @override
  Future<Either<Failure, DeficiencyDetailEntity>> getDeficiencyDetail(
      String id) async {
    try {
      final response = await deficiencyRemoteDataSource.getDeficiencyDetail(id);

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> addFavoriteDeficiency(int id) async {
    try {
      final response =
          await deficiencyRemoteDataSource.addFavoriteDeficiency(id);

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> deleteFavoriteDeficiency(int id) async {
    try {
      final response =
          await deficiencyRemoteDataSource.deleteFavoriteDeficiency(id);

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
