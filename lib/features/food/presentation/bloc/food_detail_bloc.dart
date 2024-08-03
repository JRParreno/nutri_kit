import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/features/food/domain/entities/index.dart';
import 'package:nutri_kit/features/food/domain/usecase/get_food_detail.dart';

part 'food_detail_event.dart';
part 'food_detail_state.dart';

class FoodDetailBloc extends Bloc<FoodDetailEvent, FoodDetailState> {
  final GetFoodDetail _getFoodDetail;

  FoodDetailBloc({
    required GetFoodDetail getFoodDetail,
  })  : _getFoodDetail = getFoodDetail,
        super(FoodDetailInitial()) {
    on<GetFoodDetailEvent>(onGetFoodDetailEvent);
  }

  FutureOr<void> onGetFoodDetailEvent(
      GetFoodDetailEvent event, Emitter<FoodDetailState> emit) async {
    emit(FoodDetailLoading());

    final response = await _getFoodDetail.call(GetFoodDetailParams(event.id));

    response.fold(
      (l) => emit(FoodDetailFailure(l.message)),
      (r) => emit(FoodDetailSuccess(r)),
    );
  }
}
