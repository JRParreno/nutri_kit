import 'package:dio/dio.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/interceptor/api_interceptor.dart';
import 'package:nutri_kit/core/service/env_service.dart';
import 'package:nutri_kit/features/home/data/models/index.dart';

abstract interface class TriviaRemoteDataSource {
  Future<TriviaResponseModel> getListTrivia();
  Future<TriviaModel> getDetailTrivia(int id);
}

class TriviaRemoteDataSourceImpl implements TriviaRemoteDataSource {
  final apiInstance = ApiInterceptor.apiInstance();

  @override
  Future<TriviaModel> getDetailTrivia(int id) async {
    String url = '${EnvService.get('API_URL')}/api/trivia/detail/$id';

    try {
      final response = await apiInstance.get(url);

      return TriviaModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<TriviaResponseModel> getListTrivia() async {
    String url = '${EnvService.get('API_URL')}/api/trivia/list';

    try {
      final response = await apiInstance.get(url);
      return TriviaResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
