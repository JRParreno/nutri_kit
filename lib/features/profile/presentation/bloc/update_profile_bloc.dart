import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:nutri_kit/core/common/entities/user.dart';
import 'package:nutri_kit/features/profile/domain/usecase/index.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  final UpdateProfile _updateProfile;
  final UpdatePhoto _updatePhoto;
  final AppUserCubit _appUserCubit;

  UpdateProfileBloc({
    required UpdateProfile updateProfile,
    required UpdatePhoto updatePhoto,
    required AppUserCubit appUserCubit,
  })  : _updateProfile = updateProfile,
        _updatePhoto = updatePhoto,
        _appUserCubit = appUserCubit,
        super(UpdateProfileInitial()) {
    on<UpdateProfileTrigger>(onUpdateProfileTrigger);
    on<UpdatePhotoTrigger>(onUpdatePhotoTrigger);
  }

  Future<void> onUpdateProfileTrigger(
      UpdateProfileTrigger event, Emitter<UpdateProfileState> emit) async {
    emit(UpdateProfileLoading());

    final response = await _updateProfile.call(
      UpdateProfileParams(
          firstName: event.firstName,
          lastName: event.lastName,
          email: event.email),
    );

    response.fold(
      (l) => emit(UpdateProfileFailure(l.message)),
      (r) {
        emit(UpdateProfileSuccess(r));
        _appUserCubit.updateUser(r);
      },
    );
  }

  Future<void> onUpdatePhotoTrigger(
      UpdatePhotoTrigger event, Emitter<UpdateProfileState> emit) async {
    final appUserState = _appUserCubit.state;

    if (appUserState is AppUserLoggedIn) {
      emit(UpdateProfileLoading());

      final response = await _updatePhoto.call(
        UpdatePhotoParams(
          path: event.path,
          pk: appUserState.user.profilePk,
        ),
      );

      response.fold(
        (l) {
          return emit(UpdateProfileFailure(l.message));
        },
        (r) {},
      );

      final userResponse = await _updateProfile.call(
        UpdateProfileParams(
            firstName: appUserState.user.firstName,
            lastName: appUserState.user.lastName,
            email: appUserState.user.email),
      );

      userResponse.fold(
        (l) => emit(UpdateProfileFailure(l.message)),
        (r) {
          emit(UpdateProfileSuccess(r));
          _appUserCubit.updateUser(r);
        },
      );
    }
  }
}
