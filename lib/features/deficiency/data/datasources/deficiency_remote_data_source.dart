import 'package:dio/dio.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/interceptor/api_interceptor.dart';
import 'package:nutri_kit/core/service/env_service.dart';
import 'package:nutri_kit/features/deficiency/data/models/index.dart';

abstract interface class DeficiencyRemoteDataSource {
  Future<DeficiencyDetailModel> getDeficiencyDetail(String id);
  Future<String> addFavoriteDeficiency(int id);
  Future<String> deleteFavoriteDeficiency(int id);
}

class DeficiencyRemoteDataSourceImpl implements DeficiencyRemoteDataSource {
  final apiInstance = ApiInterceptor.apiInstance();
  final baseUrl = EnvService.get('API_URL');

  @override
  Future<DeficiencyDetailModel> getDeficiencyDetail(String id) async {
    try {
      final url = '$baseUrl/api/deficiency/detail/$id';
      final response = await apiInstance.get(url);
      return DeficiencyDetailModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> addFavoriteDeficiency(int id) async {
    try {
      final url = '$baseUrl/api/deficiency-favorite/create/';

      final data = {
        "deficiency": id,
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
  Future<String> deleteFavoriteDeficiency(int id) async {
    try {
      final url = '$baseUrl/api/deficiency-favorite/delete/$id/';
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
}
