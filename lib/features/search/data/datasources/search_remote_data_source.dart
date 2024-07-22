import 'package:dio/dio.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/interceptor/api_interceptor.dart';
import 'package:nutri_kit/core/service/env_service.dart';
import 'package:nutri_kit/features/deficiency/data/models/index.dart';
import 'package:nutri_kit/features/search/data/models/index.dart';

abstract interface class SearchRemoteDataSource {
  Future<RemediesResponseModel> searchRemedies({
    required String keyword,
    String? next,
    String? previous,
  });
  Future<DeficiencyResponseModel> searchDeficiencies({
    required String keyword,
    String? next,
    String? previous,
  });
  Future<FoodResponseModel> searchFoods({
    required String keyword,
    String? next,
    String? previous,
  });

  Future<VitaminResponseModel> searchVitamins({
    required String keyword,
    String? next,
    String? previous,
  });
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final apiInstance = ApiInterceptor.apiInstance();
  final baseUrl = EnvService.get('API_URL');

  @override
  Future<DeficiencyResponseModel> searchDeficiencies({
    required String keyword,
    String? next,
    String? previous,
  }) async {
    String url = '$baseUrl/api/deficiency/list?search=$keyword';

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
  Future<FoodResponseModel> searchFoods({
    required String keyword,
    String? next,
    String? previous,
  }) async {
    String url = '$baseUrl/api/food/list?search=$keyword';

    try {
      final response = await apiInstance.get(next ?? previous ?? url);
      return FoodResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<RemediesResponseModel> searchRemedies({
    required String keyword,
    String? next,
    String? previous,
  }) async {
    String url = '$baseUrl/api/remedy/list?search=$keyword';

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

  @override
  Future<VitaminResponseModel> searchVitamins({
    required String keyword,
    String? next,
    String? previous,
  }) async {
    String url = '$baseUrl/api/vitamin/list?search=$keyword';

    try {
      final response = await apiInstance.get(next ?? previous ?? url);
      return VitaminResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
