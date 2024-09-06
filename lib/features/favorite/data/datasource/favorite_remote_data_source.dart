import 'package:dio/dio.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/interceptor/api_interceptor.dart';
import 'package:nutri_kit/core/service/env_service.dart';
import 'package:nutri_kit/features/search/data/models/index.dart';
import 'package:nutri_kit/features/search/domain/entities/index.dart';

abstract interface class FavoriteRemoteDataSource {
  Future<DeficiencySearchResponseEntity> getListFavoriteDeficiency({
    String? next,
    String? previous,
  });
  Future<RemediesResponseEntity> getListFavoriteRemedy({
    String? next,
    String? previous,
  });
}

class FavoriteRemoteDataSourceImpl implements FavoriteRemoteDataSource {
  final apiInstance = ApiInterceptor.apiInstance();
  final baseUrl = EnvService.get('API_URL');

  @override
  Future<DeficiencySearchResponseEntity> getListFavoriteDeficiency(
      {String? next, String? previous}) async {
    String url = '$baseUrl/api/deficiency-favorite/list/';

    try {
      final response = await apiInstance.get(next ?? previous ?? url);
      return DeficiencyResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<RemediesResponseEntity> getListFavoriteRemedy(
      {String? next, String? previous}) async {
    String url = '$baseUrl/api/remedy-favorite/list/';

    try {
      final response = await apiInstance.get(next ?? previous ?? url);
      return RemediesResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
