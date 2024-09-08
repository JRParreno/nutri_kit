import 'package:dio/dio.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/interceptor/api_interceptor.dart';
import 'package:nutri_kit/core/service/env_service.dart';
import 'package:nutri_kit/features/auth/data/models/index.dart';

abstract interface class ProfileRemoteDataSource {
  Future<UserModel> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
  });
  Future<String> updatePhoto({
    required String path,
    required String pk,
  });
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final apiInstance = ApiInterceptor.apiInstance();

  @override
  Future<UserModel> updateProfile({
    required String firstName,
    required String lastName,
    required String email,
  }) async {
    try {
      final data = {
        "user": {
          "first_name": firstName,
          "last_name": lastName,
          "email": email,
        }
      };

      String url = '${EnvService.get('API_URL')}/api/profile';

      final response = await apiInstance.patch(url, data: data);
      return UserModel.fromMap(response.data);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> updatePhoto({
    required String path,
    required String pk,
  }) async {
    String url = '${EnvService.get('API_URL')}/api/upload-photo/$pk';

    try {
      DateTime dateToday = DateTime.now();

      final data = FormData.fromMap(
        {
          "profile_photo": await MultipartFile.fromFile(path,
              filename: '$dateToday - ${path.split('/').last}'),
        },
      );

      await apiInstance.put(
        url,
        data: data,
        options: Options(
          contentType: "multipart/form-data",
        ),
      );
      return 'Successfully update profile';
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
