import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/common/entities/user.dart';
import 'package:nutri_kit/features/profile/domain/usecase/update_profile.dart';

part 'update_profile_event.dart';
part 'update_profile_state.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  final UpdateProfile _updateProfile;

  UpdateProfileBloc(
    UpdateProfile updateProfile,
  )   : _updateProfile = updateProfile,
        super(UpdateProfileInitial()) {
    on<UpdateProfileTrigger>(onUpdateProfileTrigger);
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
      (r) => emit(UpdateProfileSuccess(r)),
    );
  }
}
