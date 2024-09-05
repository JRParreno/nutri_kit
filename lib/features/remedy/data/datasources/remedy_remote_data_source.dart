import 'package:dio/dio.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/interceptor/api_interceptor.dart';
import 'package:nutri_kit/core/service/env_service.dart';
import 'package:nutri_kit/features/remedy/data/models/index.dart';

abstract interface class RemedyRemoteDataSource {
  Future<RemedyDetailModel> getRemedyDetail(String id);
  Future<String> addFavoriteRemedy(int id);
  Future<String> deleteFavoriteRemedy(int id);
}

class RemedyRemoteDataSourceImpl implements RemedyRemoteDataSource {
  final apiInstance = ApiInterceptor.apiInstance();
  final baseUrl = EnvService.get('API_URL');

  @override
  Future<RemedyDetailModel> getRemedyDetail(String id) async {
    try {
      final url = '$baseUrl/api/remedy/detail/$id';
      final response = await apiInstance.get(url);
      return RemedyDetailModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> addFavoriteRemedy(int id) async {
    try {
      final url = '$baseUrl/api/remedy-favorite/create/';

      final data = {
        "remedy": id,
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
  Future<String> deleteFavoriteRemedy(int id) async {
    try {
      final url = '$baseUrl/api/remedy-favorite/delete/$id/';
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
