import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_kit/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:nutri_kit/core/config/shared_prefences_keys.dart';
import 'package:nutri_kit/core/notifier/shared_preferences_notifier.dart';
import 'package:nutri_kit/features/home/presentation/pages/home.dart';
import 'package:nutri_kit/features/navigation/presentation/scaffold_with_bottom_nav.dart';
import 'package:nutri_kit/features/on_boarding/on_boarding.dart';
import 'package:nutri_kit/features/profile/presentation/pages/profile.dart';
import 'package:nutri_kit/features/search/presentation/pages/search.dart';
import 'package:nutri_kit/router/index.dart';

import '../features/auth/presentation/pages/index.dart';

/// Contains all of the app routes configurations
GoRouter routerConfig() {
  final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'mainNavigator');
  final shellNavigatorHomeKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorHomeKey');
  final shellNavigatorSearchKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorSearchKey');

  final shellNavigatorProfileKey =
      GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorProfileKey');

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: AppRoutes.login.path,
    refreshListenable:
        GoRouterRefreshStream(GetIt.instance<AppUserCubit>().stream),
    redirect: (context, state) {
      final sharedPreferencesNotifier =
          GetIt.instance<SharedPreferencesNotifier>();
      final bool isLoggedIn = sharedPreferencesNotifier.getValue(
          SharedPreferencesKeys.isLoggedIn, false);
      final bool isOnBoarded = sharedPreferencesNotifier.getValue(
          SharedPreferencesKeys.isOnBoarded, false);

      final loggingIn = state.matchedLocation == AppRoutes.login.path;
      final profilePath = state.matchedLocation == AppRoutes.profile.path;

      if (!isOnBoarded) {
        return AppRoutes.onBoarding.path;
      }

      if (isLoggedIn && loggingIn) {
        return AppRoutes.home.path;
      }

      if (!isLoggedIn && (loggingIn || profilePath)) {
        return AppRoutes.login.path;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRoutes.onBoarding.path,
        name: AppRoutes.onBoarding.name,
        pageBuilder: (context, state) {
          return buildTransitionPage(
            localKey: state.pageKey,
            child: const OnBoardingPage(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.login.path,
        name: AppRoutes.login.name,
        pageBuilder: (context, state) {
          return buildTransitionPage(
            localKey: state.pageKey,
            child: const LoginPage(),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.signup.path,
        name: AppRoutes.signup.name,
        pageBuilder: (context, state) {
          return buildTransitionPage(
            localKey: state.pageKey,
            child: const SingupPage(),
          );
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, child) => ScaffoldWithBottomNav(child: child),
        branches: [
          StatefulShellBranch(
            navigatorKey: shellNavigatorHomeKey,
            routes: [
              GoRoute(
                path: AppRoutes.home.path,
                name: AppRoutes.home.name,
                pageBuilder: (context, state) {
                  return buildTransitionPage(
                    localKey: state.pageKey,
                    child: const HomePage(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorSearchKey,
            routes: [
              GoRoute(
                path: AppRoutes.search.path,
                name: AppRoutes.search.name,
                pageBuilder: (context, state) {
                  return buildTransitionPage(
                    localKey: state.pageKey,
                    child: const SearchPage(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: shellNavigatorProfileKey,
            routes: [
              GoRoute(
                path: AppRoutes.profile.path,
                name: AppRoutes.profile.name,
                pageBuilder: (context, state) {
                  return buildTransitionPage(
                    localKey: state.pageKey,
                    child: const ProfilePage(),
                  );
                },
              ),
            ],
          ),
        ],
      )
    ],
  );
}

CustomTransitionPage buildTransitionPage({
  required LocalKey localKey,
  required Widget child,
}) {
  return CustomTransitionPage(
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.linearToEaseOut).animate(animation),
        child: child,
      );
    },
    key: localKey,
    child: child,
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
