import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nutri_kit/core/config/shared_prefences_keys.dart';
import 'package:nutri_kit/core/interceptor/get_refresh_token.dart';
import 'package:nutri_kit/core/notifier/shared_preferences_notifier.dart';

class DioInterceptor extends Interceptor {
  final _sharedPreferencesNotifier =
      GetIt.instance<SharedPreferencesNotifier>();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = _sharedPreferencesNotifier.getValue(
        SharedPreferencesKeys.accessToken, '');

    options.headers['Authorization'] = 'Bearer $token';

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      String refreshToken = _sharedPreferencesNotifier.getValue(
          SharedPreferencesKeys.refreshToken, '');
      Map<String, dynamic> userResponse =
          await GetRefreshToken.refreshToken(refreshToken: refreshToken);

      _sharedPreferencesNotifier.setValue(SharedPreferencesKeys.accessToken,
          userResponse['accessToken'] as String);
      _sharedPreferencesNotifier.setValue(SharedPreferencesKeys.refreshToken,
          userResponse['refreshToken'] as String);
    }
    super.onError(err, handler);
  }
}
