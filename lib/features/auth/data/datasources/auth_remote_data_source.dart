import 'package:dio/dio.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/service/env_service.dart';
import 'package:nutri_kit/features/auth/data/models/index.dart';

abstract interface class AuthRemoteDataSource {
  Future<LoginResponseModel> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<SignupResponseModel> signup({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String confirmPassword,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio = Dio();

  @override
  Future<LoginResponseModel> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      String url = '${EnvService.get('API_URL')}/o/login/';
      Map<String, dynamic> data = {
        'username': email,
        'password': password,
        'grant_type': 'password',
        'client_id': EnvService.get('CLIENT_ID'),
        'client_secret': EnvService.get('CLIENT_SECRET')
      };

      final response = await dio.post(url, data: data);
      return LoginResponseModel.fromMap(response.data);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_description'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<SignupResponseModel> signup({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      String url = '${EnvService.get('API_URL')}/api/signup';
      Map<String, dynamic> data = {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'password': password,
        'confirm_password': confirmPassword,
        'age': 0,
      };

      final response = await dio.post(url, data: data);
      return SignupResponseModel.fromMap(response.data);
    } on DioException catch (e) {
      throw ServerException(
        e.response?.data['error_message'] ?? 'Something went wrong.',
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
