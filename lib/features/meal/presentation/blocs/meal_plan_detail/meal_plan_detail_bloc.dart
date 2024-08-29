import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutri_kit/features/meal/domain/entities/index.dart';
import 'package:nutri_kit/features/meal/domain/usecase/index.dart';

part 'meal_plan_detail_event.dart';
part 'meal_plan_detail_state.dart';

class MealPlanDetailBloc
    extends Bloc<MealPlanDetailEvent, MealPlanDetailState> {
  final GetChildMealPlanDetail _getChildMealPlanDetail;
  final UpdateDayMealCompletionComplete _updateDayMealCompletionComplete;

  MealPlanDetailBloc(
      {required GetChildMealPlanDetail getChildMealPlanDetail,
      required UpdateDayMealCompletionComplete updateDayMealCompletionComplete})
      : _getChildMealPlanDetail = getChildMealPlanDetail,
        _updateDayMealCompletionComplete = updateDayMealCompletionComplete,
        super(MealPlanDetailInitial()) {
    on<GetMealPlanDetailEvent>(onGetMealPlanDetailEvent);
    on<UpdateMealPlanCompleted>(onUpdateMealPlanCompleted);
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

  Future<void> onUpdateMealPlanCompleted(
      UpdateMealPlanCompleted event, Emitter<MealPlanDetailState> emit) async {
    final state = this.state;

    if (state is MealPlanDetailSuccess) {
      emit(MealPlanDetailLoading());

      await _updateDayMealCompletionComplete(
          UpdateDayMealCompletionCompleteParams(
              id: event.id, isCompleted: event.isCompleted));

      final dayMealCompletions = [
        ...state.userMealPlanDetailEntity.dayMealCompletion
      ];
      final index = dayMealCompletions.indexWhere(
        (element) => element.id == event.id,
      );

      dayMealCompletions[index] =
          dayMealCompletions[index].copyWith(completed: event.isCompleted);

      emit(
        MealPlanDetailSuccess(
          UserMealPlanDetailEntity(
            dayMealCompletion: dayMealCompletions,
            healthStatus: state.userMealPlanDetailEntity.healthStatus,
            name: state.userMealPlanDetailEntity.name,
            userMealPlan: state.userMealPlanDetailEntity.userMealPlan,
          ),
        ),
      );
    }
  }
}
