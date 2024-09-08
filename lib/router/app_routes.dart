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
  forgotPassword(
    name: 'forgot_password',
    path: '/forgot_password',
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
  searchDeficiency(
    name: 'search_deficiency',
    path: '/search_deficiency/:keyword',
  ),
  searchRemedy(
    name: 'search_remedy',
    path: '/search_remedy/:keyword',
  ),
  searchFood(
    name: 'search_food',
    path: '/search_food/:keyword',
  ),
  searchVitamin(
    name: 'search_vitamin',
    path: '/search_vitamin/:keyword',
  ),
  remedyDetail(
    name: 'remedy_detail',
    path: '/remedy_detail/:id',
  ),
  foodDetail(
    name: 'food_detail',
    path: '/food_detail/:id',
  ),
  vitaminDetail(
    name: 'vitamin_detail',
    path: '/vitamin_detail/:id',
  ),
  deficiencyDetail(
    name: 'deficiency_detail',
    path: '/deficiency_detail/:id',
  ),
  profile(
    name: 'profile',
    path: '/profile',
  ),
  changePassword(
    name: 'change_password',
    path: '/change_password',
  ),
  updateProfile(
    name: 'update_profile',
    path: 'update_profile',
  ),
  updatePhoto(
    name: '/update_photo',
    path: '/update_photo',
  ),
  favorite(
    name: 'favorite',
    path: '/favorite',
  ),
  favoriteDeficiency(
    name: 'favorite-deficiency',
    path: '/favorite/deficiency',
  ),
  favoriteRemedy(
    name: 'favorite-remedy',
    path: '/favorite/remedy',
  ),
  favoriteFood(
    name: 'favorite-food',
    path: '/favorite/food',
  ),
  favoriteVitamin(
    name: 'favorite-vitamin',
    path: '/favorite/vitamin',
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
    path:
        '/child_meal_plan_detail_page/:userMealPlanId/meal-plan/:mealPlanId/isCreated/:isCreated',
  ),
  mealBreakdownPage(
    name: '/meal_breakdown_page',
    path: '/meal_breakdown_page',
  ),
  deficiencyViewPage(
    name: '/deficiency_view_page',
    path: '/deficiency_view_page/:health_status',
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
