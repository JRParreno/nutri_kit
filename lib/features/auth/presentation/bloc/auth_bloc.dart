import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:nutri_kit/core/common/entities/user.dart';
import 'package:nutri_kit/core/config/shared_prefences_keys.dart';
import 'package:nutri_kit/core/notifier/shared_preferences_notifier.dart';
import 'package:nutri_kit/features/auth/domain/usecase/user_signup.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SharedPreferencesNotifier _sharedPreferencesNotifier;
  final UserSignup _userSignup;
  final AppUserCubit _appUserCubit;

  AuthBloc({
    required UserSignup userSignup,
    required SharedPreferencesNotifier sharedPreferencesNotifier,
    required AppUserCubit appUserCubit,
  })  : _userSignup = userSignup,
        _appUserCubit = appUserCubit,
        _sharedPreferencesNotifier = sharedPreferencesNotifier,
        super(AuthInitial()) {
    on<AuthSignupEvent>(onAuthSignupEvent);
  }

  Future<void> onAuthSignupEvent(
      AuthSignupEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final res = await _userSignup.call(UserSignupParams(
      firstName: event.firstName,
      lastName: event.lastName,
      age: event.age,
      password: event.password,
      confirmPassword: event.confirmPassword,
      email: event.email,
    ));

    res.fold(
      (l) => emit(AuthFailure(l.messsage)),
      (r) {
        // this will save token in localstorage
        handleSetInfo(accessToken: r.accessToken, refreshToken: r.refreshToken);
        // handle set user cubit and emit
        handleSetUserCubit(emit: emit, user: r.user);
      },
    );
  }

  void handleSetInfo(
      {required String accessToken, required String refreshToken}) {
    _sharedPreferencesNotifier.setValue(SharedPreferencesKeys.isLoggedIn, true);
    _sharedPreferencesNotifier.setValue(
        SharedPreferencesKeys.accessToken, accessToken);
    _sharedPreferencesNotifier.setValue(
        SharedPreferencesKeys.refreshToken, refreshToken);
  }

  void handleSetUserCubit(
      {required User user, required Emitter<AuthState> emit}) {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
