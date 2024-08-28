part of 'create_child_health_form_bloc.dart';

sealed class CreateChildHealthFormState extends Equatable {
  const CreateChildHealthFormState();

  @override
  List<Object> get props => [];
}

final class CreateChildHealthFormInitial extends CreateChildHealthFormState {}

final class CreateChildHealthFormLoading extends CreateChildHealthFormState {}

final class CreateChildHealthFormSuccess extends CreateChildHealthFormState {
  final UserMealPlanCreationEntity userMealPlanCreationEntity;

  const CreateChildHealthFormSuccess(this.userMealPlanCreationEntity);

  @override
  List<Object> get props => [userMealPlanCreationEntity];
}

final class CreateChildHealthFormFailure extends CreateChildHealthFormState {
  final String message;

  const CreateChildHealthFormFailure(this.message);
  @override
  List<Object> get props => [message];
}
