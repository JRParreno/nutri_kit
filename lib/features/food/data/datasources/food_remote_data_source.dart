import 'package:dio/dio.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/interceptor/api_interceptor.dart';
import 'package:nutri_kit/core/service/env_service.dart';
import 'package:nutri_kit/features/search/data/models/index.dart';

abstract interface class FoodRemoteDataSource {
  Future<FoodModel> getFoodDetail(String id);
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
}
