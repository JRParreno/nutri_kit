part of 'trivia_bloc.dart';

sealed class TriviaState extends Equatable {
  const TriviaState();

  @override
  List<Object> get props => [];
}

final class TriviaInitial extends TriviaState {}

final class TriviaLoading extends TriviaState {}

final class TriviaLoaded extends TriviaState {
  final TriviaResponse triviaResponse;

  const TriviaLoaded(this.triviaResponse);

  @override
  List<Object> get props => [triviaResponse];
}

final class TriviaFailure extends TriviaState {
  final String message;

  const TriviaFailure(this.message);

  @override
  List<Object> get props => [message];
}
