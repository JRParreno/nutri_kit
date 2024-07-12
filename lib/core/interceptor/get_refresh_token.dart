import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetRefreshToken {
  static FutureOr refreshToken({required String refreshToken}) async {
    await dotenv.load(fileName: '.env');

    String url = '${dotenv.env['API_URL']}/o/token/';
    Map<String, dynamic> data = {
      'refresh_token': refreshToken,
      'grant_type': 'refresh_token',
      'client_id': dotenv.env['CLIENT_ID'],
      'client_secret': dotenv.env['CLIENT_SECRET']
    };
    final Dio dio = Dio();
    final userDetails = await dio.post(url, data: data);

    if (userDetails.statusCode == 400) {
      return {'statusCode': userDetails.statusCode, 'data': userDetails.data};
    }

    Map<String, dynamic> responseJson = userDetails.data;
    return {
      'accessToken': responseJson['access_token'],
      'refreshToken': responseJson['refresh_token'],
      'statusCode': userDetails.statusCode,
    };
  }
}
