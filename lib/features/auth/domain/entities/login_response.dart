import 'package:equatable/equatable.dart';
import 'package:nutri_kit/features/auth/data/models/index.dart';

class LoginResponse extends Equatable {
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  const LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
        user,
      ];
}
