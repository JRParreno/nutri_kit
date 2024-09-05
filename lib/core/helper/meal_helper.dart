import 'package:nutri_kit/features/meal/domain/entities/index.dart';

class MealHelper {
  List<DayMealCompletionEntity> updateCompletedDailyMeal({
    required List<DayMealCompletionEntity> data,
    required int index,
    required int id,
    bool isCompleted = false,
  }) {
    final dayMealCompletions = [...data];

    dayMealCompletions[index] =
        dayMealCompletions[index].copyWith(completed: isCompleted);

    return dayMealCompletions;
  }

  UserMealPlanDetailEntity updateDayMealPlanCurrentNutrients({
    required UserMealPlanDetailEntity data,
    required DayMealCompletionEntity dayMealCompletionEntity,
  }) {
    int currentCalories = 0;
    double currentProtein = 0;
    double currentCarbs = 0;
    double currentFats = 0;

    final dayMealPlan = dayMealCompletionEntity.dayMealPlan;
    final breakfast = dayMealPlan.breakfast;
    final midMorningSnack = dayMealPlan.midMorningSnack;
    final lunch = dayMealPlan.lunch;
    final afternoonSnack = dayMealPlan.afternoonSnack;
    final dinner = dayMealPlan.dinner;
    final eveningSnack = dayMealPlan.eveningSnack;

    if (breakfast != null) {
      currentCalories += breakfast.calories;
      currentProtein += breakfast.protein;
      currentCarbs += breakfast.carbs;
      currentFats += breakfast.fats;
    }
    if (midMorningSnack != null) {
      currentCalories += midMorningSnack.calories;
      currentProtein += midMorningSnack.protein;
      currentCarbs += midMorningSnack.carbs;
      currentFats += midMorningSnack.fats;
    }
    if (lunch != null) {
      currentCalories += lunch.calories;
      currentProtein += lunch.protein;
      currentCarbs += lunch.carbs;
      currentFats += lunch.fats;
    }
    if (afternoonSnack != null) {
      currentCalories += afternoonSnack.calories;
      currentProtein += afternoonSnack.protein;
      currentCarbs += afternoonSnack.carbs;
      currentFats += afternoonSnack.fats;
    }
    if (dinner != null) {
      currentCalories += dinner.calories;
      currentProtein += dinner.protein;
      currentCarbs += dinner.carbs;
      currentFats += dinner.fats;
    }
    if (eveningSnack != null) {
      currentCalories += eveningSnack.calories;
      currentProtein += eveningSnack.protein;
      currentCarbs += eveningSnack.carbs;
      currentFats += eveningSnack.fats;
    }

    return data.copyWith(
      currentCalories: currentCalories.toDouble(),
      currentCarbs: currentCarbs,
      currentFats: currentFats,
      currentProtein: currentProtein,
    );
  }
}
