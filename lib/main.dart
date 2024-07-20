import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nutri_kit/core/common/cubits/cubit/app_user_cubit.dart';
import 'package:nutri_kit/core/config/shared_prefences_keys.dart';
import 'package:nutri_kit/core/notifier/shared_preferences_notifier.dart';
import 'package:nutri_kit/core/theme/theme.dart';
import 'package:nutri_kit/dependency_injection_config.dart' as di;
import 'package:nutri_kit/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nutri_kit/features/home/presentation/bloc/trivia_bloc/trivia_bloc.dart';
import 'package:nutri_kit/features/profile/presentation/bloc/update_profile_bloc.dart';
import 'package:nutri_kit/features/search/presentation/blocs/search/search_bloc.dart';
import 'package:nutri_kit/router/app_router.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await di.initDependencies();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.serviceLocator<AppUserCubit>(),
        ),
        BlocProvider(
          create: (context) => di.serviceLocator<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => di.serviceLocator<TriviaBloc>(),
        ),
        BlocProvider(
          create: (context) => di.serviceLocator<SearchBloc>(),
        ),
        BlocProvider(
          create: (context) => di.serviceLocator<UpdateProfileBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

final router = routerConfig();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isConnectedToInternet = true;
  StreamSubscription? _internetConnectionStreamSubscription;
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
    checkIsUserLoggedIn();

    Future.delayed(const Duration(seconds: 2), () {
      FlutterNativeSplash.remove();
    });
  }

  @override
  void dispose() {
    _internetConnectionStreamSubscription?.cancel();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightThemeMode,
        routerConfig: router,
        scaffoldMessengerKey: scaffoldMessengerKey,
      ),
    );
  }

  void checkIsUserLoggedIn() {
    // This will handle to get profile if user is logged in
    final sharedPreferencesNotifier =
        GetIt.instance<SharedPreferencesNotifier>();
    final bool isLoggedIn = sharedPreferencesNotifier.getValue(
        SharedPreferencesKeys.isLoggedIn, false);

    if (isLoggedIn) {
      context.read<AuthBloc>().add(AuthIsUserLoggedIn());
    }
  }

  void checkInternetConnection() {
    _internetConnectionStreamSubscription =
        InternetConnection().onStatusChange.listen((event) {
      switch (event) {
        case InternetStatus.connected:
          setState(() => isConnectedToInternet = true);
          break;
        case InternetStatus.disconnected:
          setState(() => isConnectedToInternet = false);
          break;
        default:
          setState(() => isConnectedToInternet = false);
      }

      if (!isConnectedToInternet) {
        const snackBar = SnackBar(
          content: Text("You are disconnected to the internet."),
        );

        scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
      }
    });
  }
}
