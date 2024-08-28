import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/features/meal/domain/entities/index.dart';
import 'package:nutri_kit/features/meal/domain/usecase/create_child_health_form.dart';

part 'create_child_health_form_event.dart';
part 'create_child_health_form_state.dart';

class CreateChildHealthFormBloc
    extends Bloc<CreateChildHealthFormEvent, CreateChildHealthFormState> {
  final CreateChildHealthForm _createChildHealthForm;

  CreateChildHealthFormBloc(CreateChildHealthForm createChildHealthForm)
      : _createChildHealthForm = createChildHealthForm,
        super(CreateChildHealthFormInitial()) {
    on<CreateChildHealthFormSubmitEvent>(onCreateChildHealthFormSubmitEvent);
  }

  Future<void> onCreateChildHealthFormSubmitEvent(
    CreateChildHealthFormSubmitEvent event,
    Emitter<CreateChildHealthFormState> emit,
  ) async {
    emit(CreateChildHealthFormLoading());

    final response = await _createChildHealthForm(
      CreateChildHealthFormParams(
        birthdate: event.birthdate,
        gender: event.gender,
        healthStatus: event.healthStatus,
        height: event.height,
        weight: event.weight,
        name: event.name,
      ),
    );

    response.fold(
      (l) => emit(CreateChildHealthFormFailure(l.message)),
      (r) => emit(CreateChildHealthFormSuccess(r)),
    );
  }
}
