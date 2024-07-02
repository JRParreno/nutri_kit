import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:nutri_kit/features/on_boarding/on_boarding.dart';
import 'package:nutri_kit/router/index.dart';

import '../features/auth/presentation/pages/index.dart';

/// Contains all of the app routes configurations
class AppRouter {
  static final router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    initialLocation: AppRoutes.onBoarding.path,
    redirect: (context, state) {
      // final sharedPreferencesNotifier =
      //     GetIt.instance<SharedPreferencesNotifier>();
      // final bool isLoggedIn = sharedPreferencesNotifier.getValue(
      //     SharedPreferencesKeys.isLoggedIn, false);
      // final bool isOnBoarded = sharedPreferencesNotifier.getValue(
      //     SharedPreferencesKeys.isOnBoarded, false);

      // final appUserState = context.read<AppUserCubit>().state;
      // final loginPath = AppRoutes.login.path;

      // final bool loggingIn = state.matchedLocation == loginPath;

      // if (isLoggedIn || (appUserState is AppUserLoggedIn && loggingIn)) {
      //   return AppRoutes.home.path;
      // }

      // if (isOnBoarded) {
      //   return AppRoutes.login.path;
      // }

      // if (!(isLoggedIn && isOnBoarded)) {
      //   return AppRoutes.onBoarding.path;
      // }

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
