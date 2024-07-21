part of 'search_deficiency_bloc.dart';

sealed class SearchDeficiencyState extends Equatable {
  const SearchDeficiencyState();

  @override
  List<Object> get props => [];
}

final class SearchDeficiencyInitial extends SearchDeficiencyState {}

final class SearchDeficiencyLoaded extends SearchDeficiencyState {
  final DeficiencyResponseEntity deficiencyResponse;

  const SearchDeficiencyLoaded(this.deficiencyResponse);

  @override
  List<Object> get props => [
        deficiencyResponse,
      ];
}

final class SearchDeficiencyFailure extends SearchDeficiencyState {
  final String message;

  const SearchDeficiencyFailure(this.message);

  @override
  List<Object> get props => [
        message,
      ];
}
