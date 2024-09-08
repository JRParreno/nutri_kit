part of 'app_user_cubit.dart';

@immutable
sealed class AppUserState extends Equatable {
  const AppUserState();
  @override
  List<Object?> get props => [];
}

final class AppUserInitial extends AppUserState {}

final class GettingAppUser extends AppUserState {}

final class AppUserLoggedIn extends AppUserState {
  final User user;

  const AppUserLoggedIn(this.user);

  @override
  List<Object?> get props => [
        user,
      ];
}

final class AppUserFail extends AppUserState {
  final String message;

  const AppUserFail(this.message);
}
