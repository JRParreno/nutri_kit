import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/features/meal/domain/entities/index.dart';
import 'package:nutri_kit/features/meal/domain/usecase/get_child_meal_plan_detail.dart';

part 'meal_plan_detail_event.dart';
part 'meal_plan_detail_state.dart';

class MealPlanDetailBloc
    extends Bloc<MealPlanDetailEvent, MealPlanDetailState> {
  final GetChildMealPlanDetail _getChildMealPlanDetail;

  MealPlanDetailBloc(GetChildMealPlanDetail getChildMealPlanDetail)
      : _getChildMealPlanDetail = getChildMealPlanDetail,
        super(MealPlanDetailInitial()) {
    on<GetMealPlanDetailEvent>(onGetMealPlanDetailEvent);
  }

  Future<void> onGetMealPlanDetailEvent(
      GetMealPlanDetailEvent event, Emitter<MealPlanDetailState> emit) async {
    emit(MealPlanDetailLoading());

    final response = await _getChildMealPlanDetail.call(
      GetChildMealPlanDetailParams(
          mealPlanId: event.mealPlanId, userMealPlanId: event.userMealPlanId),
    );

    response.fold(
      (l) => emit(MealPlanDetailFailure(l.message)),
      (r) => emit(MealPlanDetailSuccess(r)),
    );
  }
}
