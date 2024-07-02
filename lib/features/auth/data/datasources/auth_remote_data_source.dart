import 'package:dio/dio.dart';
import 'package:nutri_kit/features/auth/data/models/login_response_model.dart';
import 'package:nutri_kit/core/error/exceptions.dart';
import 'package:nutri_kit/core/service/env_service.dart';

abstract interface class AuthRemoteDataSource {
  Future<LoginResponseModel> loginWithEmailPassword({
    required String email,
    required String password,
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

      return await dio.post(url, data: data).then((value) {
        return LoginResponseModel(
            data: value.data, status: value.statusCode?.toString() ?? '');
      });
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
