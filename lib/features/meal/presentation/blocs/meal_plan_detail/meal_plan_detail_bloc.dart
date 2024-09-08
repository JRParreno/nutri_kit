import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/core/helper/meal_helper.dart';
import 'package:nutri_kit/features/meal/domain/entities/index.dart';
import 'package:nutri_kit/features/meal/domain/usecase/index.dart';

part 'meal_plan_detail_event.dart';
part 'meal_plan_detail_state.dart';

class MealPlanDetailBloc
    extends Bloc<MealPlanDetailEvent, MealPlanDetailState> {
  final GetChildMealPlanDetail _getChildMealPlanDetail;
  final UpdateDayMealCompletionComplete _updateDayMealCompletionComplete;
  final DeleteUserMealPlan _deleteUserMealPlan;

  MealPlanDetailBloc({
    required GetChildMealPlanDetail getChildMealPlanDetail,
    required UpdateDayMealCompletionComplete updateDayMealCompletionComplete,
    required DeleteUserMealPlan deleteUserMealPlan,
  })  : _getChildMealPlanDetail = getChildMealPlanDetail,
        _deleteUserMealPlan = deleteUserMealPlan,
        _updateDayMealCompletionComplete = updateDayMealCompletionComplete,
        super(MealPlanDetailInitial()) {
    on<GetMealPlanDetailEvent>(onGetMealPlanDetailEvent);
    on<UpdateMealPlanCompleted>(onUpdateMealPlanCompleted);
    on<DeleteUserMealPlanEvent>(onDeleteUserMealPlanEvent);
  }

  Future<void> onDeleteUserMealPlanEvent(
      DeleteUserMealPlanEvent event, Emitter<MealPlanDetailState> emit) async {
    final state = this.state;

    if (state is MealPlanDetailSuccess) {
      emit(MealPlanDetailLoading());
      final response = await _deleteUserMealPlan.call(
        DeleteUserMealPlanParams(event.id),
      );

      response.fold(
        (l) => emit(MealPlanDetailFailure(l.message)),
        (r) => emit(MealPlanDetailDelete(r)),
      );
    }
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
      (r) => emit(MealPlanDetailSuccess(userMealPlanDetailEntity: r)),
    );
  }

  Future<void> onUpdateMealPlanCompleted(
      UpdateMealPlanCompleted event, Emitter<MealPlanDetailState> emit) async {
    final state = this.state;

    if (state is MealPlanDetailSuccess) {
      emit(MealPlanDetailLoading());

      await _updateDayMealCompletionComplete(
          UpdateDayMealCompletionCompleteParams(
              id: event.id, isCompleted: event.isCompleted));

      final mealHelper = MealHelper();

      final tempDayMealCompletions = [
        ...state.userMealPlanDetailEntity.dayMealCompletion
      ];
      final index = tempDayMealCompletions.indexWhere(
        (element) => element.id == event.id,
      );

      final dayMealCompletions = mealHelper.updateCompletedDailyMeal(
        data: tempDayMealCompletions,
        index: index,
        id: event.id,
        isCompleted: true,
      );

      final updatedUserMealPlanDetailEntity =
          mealHelper.updateDayMealPlanCurrentNutrients(
        data: state.userMealPlanDetailEntity
            .copyWith(dayMealCompletion: dayMealCompletions),
        dayMealCompletionEntity: dayMealCompletions[index],
      );

      emit(
        MealPlanDetailSuccess(
          userMealPlanDetailEntity: updatedUserMealPlanDetailEntity,
          isUpdatingValue: true,
        ),
      );
    }
  }
}
