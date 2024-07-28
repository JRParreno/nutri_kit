import 'package:fpdart/fpdart.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/error/failure.dart';
import 'package:nutri_kit/features/remedy/data/datasources/remedy_remote_data_source.dart';
import 'package:nutri_kit/features/remedy/domain/entities/index.dart';
import 'package:nutri_kit/features/remedy/domain/repository/remedy_repository.dart';

class RemedyRepositoryImpl implements RemedyRepository {
  final RemedyRemoteDataSource remedyRemoteDataSource;

  RemedyRepositoryImpl(this.remedyRemoteDataSource);

  @override
  Future<Either<Failure, RemedyDetailEntity>> getRemedyDetail(String id) async {
    try {
      final response = await remedyRemoteDataSource.getRemedyDetail(id);
      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
