class UserMealPlanCreationEntity {
  final String usermealplanId;
  final String mealplanId;
  final List<String> healthStatusInfos;

  UserMealPlanCreationEntity({
    required this.usermealplanId,
    required this.mealplanId,
    required this.healthStatusInfos,
  });
}
