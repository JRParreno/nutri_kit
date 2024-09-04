/// Represents the app routes and their paths.
enum AppRoutes {
  onBoarding(
    name: 'on_boarding',
    path: '/on_boarding',
  ),
  login(
    name: 'login',
    path: '/login',
  ),
  signup(
    name: 'signup',
    path: '/signup',
  ),
  home(
    name: 'home',
    path: '/home',
  ),
  homePDFViewer(
    name: 'home_pdf_viewer',
    path: '/home_pdf_viewer',
  ),
  search(
    name: 'search',
    path: '/search',
  ),
  remedyDetail(
    name: 'remedy_detail',
    path: '/remedy_detail/:id',
  ),
  foodDetail(
    name: 'food_detail',
    path: '/food_detail/:id',
  ),
  deficiencyDetail(
    name: 'deficiency_detail',
    path: '/deficiency_detail/:id',
  ),
  profile(
    name: 'profile',
    path: '/profile',
  ),
  updateProfile(
    name: 'update_profile',
    path: 'update_profile',
  ),
  meal(
    name: 'meal',
    path: '/meal',
  ),
  createChildHealthForm(
    name: '/create_child_health_form',
    path: '/create_child_health_form',
  ),
  firstCreateChildHealthForm(
    name: '/first_create_child_health_form',
    path: '/first_create_child_health_form',
  ),
  chidlMealPlanDetailPage(
    name: '/child_meal_plan_detail_page',
    path: '/child_meal_plan_detail_page/:userMealPlanId/meal-plan/:mealPlanId',
  ),
  mealBreakdownPage(
    name: '/meal_breakdown_page',
    path: '/meal_breakdown_page',
  );

  const AppRoutes({
    required this.name,
    required this.path,
  });

  /// Represents the route name
  ///
  /// Example: `AppRoutes.splash.name`
  /// Returns: 'splash'
  final String name;

  /// Represents the route path
  ///
  /// Example: `AppRoutes.splash.path`
  /// Returns: '/splash'
  final String path;

  @override
  String toString() => name;
}
