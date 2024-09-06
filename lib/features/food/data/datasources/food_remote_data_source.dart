import 'package:dio/dio.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/interceptor/api_interceptor.dart';
import 'package:nutri_kit/core/service/env_service.dart';
import 'package:nutri_kit/features/search/data/models/index.dart';

abstract interface class FoodRemoteDataSource {
  Future<FoodModel> getFoodDetail(String id);
  Future<VitaminModel> getVitaminDetail(String id);
  Future<String> addFavoriteFood(int id);
  Future<String> deleteFavoriteFood(int id);
  Future<String> addFavoriteVitamin(int id);
  Future<String> deleteFavoriteVitamin(int id);
}

class FoodRemoteDataSourceImpl implements FoodRemoteDataSource {
  final apiInstance = ApiInterceptor.apiInstance();
  final baseUrl = EnvService.get('API_URL');

  @override
  Future<FoodModel> getFoodDetail(String id) async {
    try {
      final url = '$baseUrl/api/food/detail/$id';
      final response = await apiInstance.get(url);
      return FoodModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> addFavoriteFood(int id) async {
    try {
      final url = '$baseUrl/api/food-favorite/create/';

      final data = {
        "food": id,
      };

      await apiInstance.post(url, data: data);
      return 'Successfully add to favorite';
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> deleteFavoriteFood(int id) async {
    try {
      final url = '$baseUrl/api/food-favorite/delete/$id/';
      await apiInstance.delete(url);
      return 'Successfully remove in favorite';
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> addFavoriteVitamin(int id) async {
    try {
      final url = '$baseUrl/api/vitamin-favorite/create/';

      final data = {
        "vitamin": id,
      };

      await apiInstance.post(url, data: data);
      return 'Successfully add to favorite';
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> deleteFavoriteVitamin(int id) async {
    try {
      final url = '$baseUrl/api/vitamin-favorite/delete/$id/';
      await apiInstance.delete(url);
      return 'Successfully remove in favorite';
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<VitaminModel> getVitaminDetail(String id) async {
    try {
      final url = '$baseUrl/api/vitamin/detail/$id';
      final response = await apiInstance.get(url);
      return VitaminModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
