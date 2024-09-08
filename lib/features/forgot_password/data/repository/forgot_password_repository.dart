import 'package:nutri_kit/features/forgot_password/domain/models/forgot_password_response.dart';

abstract class ForgotPasswordRepository {
  Future<ForgotPasswordResponse> sendForgotPasswordEmail({
    required String email,
  });
}
