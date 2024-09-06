import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/features/food/domain/entities/index.dart';
import 'package:nutri_kit/features/food/domain/usecase/index.dart';

part 'food_detail_event.dart';
part 'food_detail_state.dart';

class FoodDetailBloc extends Bloc<FoodDetailEvent, FoodDetailState> {
  final GetFoodDetail _getFoodDetail;
  final DeleteFavoriteFood _deleteFavoriteFood;
  final AddFavoriteFood _addFavoriteFood;

  FoodDetailBloc({
    required GetFoodDetail getFoodDetail,
    required DeleteFavoriteFood deleteFavoriteFood,
    required AddFavoriteFood addFavoriteFood,
  })  : _getFoodDetail = getFoodDetail,
        _deleteFavoriteFood = deleteFavoriteFood,
        _addFavoriteFood = addFavoriteFood,
        super(FoodDetailInitial()) {
    on<GetFoodDetailEvent>(onGetFoodDetailEvent);
    on<AddFavoriteFoodEvent>(onAddFavoriteFoodEvent);
    on<DeleteFavoriteFoodEvent>(onDeleteFavoriteFoodEvent);
  }

  FutureOr<void> onGetFoodDetailEvent(
      GetFoodDetailEvent event, Emitter<FoodDetailState> emit) async {
    emit(FoodDetailLoading());

    final response = await _getFoodDetail.call(GetFoodDetailParams(event.id));

    response.fold(
      (l) => emit(FoodDetailFailure(l.message)),
      (r) => emit(FoodDetailSuccess(foodEntity: r)),
    );
  }

  FutureOr<void> onAddFavoriteFoodEvent(
      AddFavoriteFoodEvent event, Emitter<FoodDetailState> emit) async {
    final state = this.state;

    if (state is FoodDetailSuccess) {
      emit(FoodDetailLoading());

      final response =
          await _addFavoriteFood(AddFavoriteFoodParams(state.foodEntity.id));

      response.fold(
        (l) => emit(FoodDetailFailure(l.message)),
        (r) => emit(
          FoodDetailSuccess(
            foodEntity: state.foodEntity.copyWith(
              isFavorite: true,
            ),
            message: r,
          ),
        ),
      );
    }
  }

  FutureOr<void> onDeleteFavoriteFoodEvent(
      DeleteFavoriteFoodEvent event, Emitter<FoodDetailState> emit) async {
    final state = this.state;

    if (state is FoodDetailSuccess) {
      emit(FoodDetailLoading());

      final response = await _deleteFavoriteFood(
          DeleteFavoriteFoodParams(state.foodEntity.id));

      response.fold(
        (l) => emit(FoodDetailFailure(l.message)),
        (r) => emit(
          FoodDetailSuccess(
            foodEntity: state.foodEntity.copyWith(
              isFavorite: false,
            ),
            message: r,
          ),
        ),
      );
    }
  }
}
