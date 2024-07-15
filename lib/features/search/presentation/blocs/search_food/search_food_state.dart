part of 'search_food_bloc.dart';

sealed class SearchFoodState extends Equatable {
  const SearchFoodState();
  
  @override
  List<Object> get props => [];
}

final class SearchFoodInitial extends SearchFoodState {}

