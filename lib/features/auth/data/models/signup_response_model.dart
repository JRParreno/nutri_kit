import 'package:nutri_kit/features/auth/data/models/user_model.dart';
import 'package:nutri_kit/features/auth/domain/entities/signup_response.dart';

class SignupResponseModel extends SingupResponse {
  const SignupResponseModel({
    required super.accessToken,
    required super.refreshToken,
    required super.user,
  });

  factory SignupResponseModel.fromMap(Map<String, dynamic> map) {
    return SignupResponseModel(
      accessToken: map['access_token'],
      refreshToken: map['refresh_token'],
      user: UserModel.fromMap(map),
    );
  }
}
