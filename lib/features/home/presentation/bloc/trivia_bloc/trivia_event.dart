part of 'trivia_bloc.dart';

sealed class TriviaEvent extends Equatable {
  const TriviaEvent();

  @override
  List<Object> get props => [];
}

final class TriviaGetList extends TriviaEvent {}

final class TriviaPaginate extends TriviaEvent {}
