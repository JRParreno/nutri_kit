part of 'search_remedy_bloc.dart';

sealed class SearchRemedyState extends Equatable {
  const SearchRemedyState();
  
  @override
  List<Object> get props => [];
}

final class SearchRemedyInitial extends SearchRemedyState {}
