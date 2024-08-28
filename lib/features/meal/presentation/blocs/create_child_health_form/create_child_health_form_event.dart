part of 'create_child_health_form_bloc.dart';

sealed class CreateChildHealthFormEvent extends Equatable {
  const CreateChildHealthFormEvent();

  @override
  List<Object> get props => [];
}

final class CreateChildHealthFormSubmitEvent
    extends CreateChildHealthFormEvent {
  final String name;
  final String weight;
  final String height;
  final String healthStatus;
  final String birthdate;
  final String gender;

  const CreateChildHealthFormSubmitEvent({
    required this.name,
    required this.weight,
    required this.height,
    required this.healthStatus,
    required this.birthdate,
    required this.gender,
  });

  @override
  List<Object> get props => [
        name,
        weight,
        height,
        healthStatus,
        birthdate,
        gender,
      ];
}
