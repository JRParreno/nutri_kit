import 'package:dio/dio.dart';
import 'package:nutri_kit/core/interceptor/api_interceptor.dart';
import 'package:nutri_kit/core/service/env_service.dart';
import 'package:nutri_kit/features/change_password/data/repository/change_password_repository.dart';
import 'package:nutri_kit/features/change_password/domain/models/change_password_response.dart';

class ChangePasswordRepositoryImpl extends ChangePasswordRepository {
  @override
  Future<ChangePasswordResponse> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    String url = '${EnvService.get('API_URL')}/api/change-password';

    Map<String, dynamic> data = {
      'old_password': oldPassword,
      'new_password': newPassword,
    };

    return await ApiInterceptor.apiInstance()
        .patch(url, data: data)
        .then((value) {
      final result = ChangePasswordResponse.fromMap(
        value.data as Map<String, dynamic>,
      );

      return result;
    }).onError((Response<dynamic> error, stackTrace) {
      throw {
        'status': error.statusCode.toString(),
        'data': error.data,
      };
    }).catchError((onError) {
      final error = onError as DioException;

      if (error.response != null && error.response!.data != null) {
        throw {
          'status': error.response?.statusCode ?? '400',
          'data': error.response!.data,
        };
      }

      throw error;
    });
  }
}
