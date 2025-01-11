import 'package:dalel/core/services/services_locator.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/views/log_in_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel/features/on_boarding/peresentation/views/onboarding_view.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => SplashView(),
  ),
  GoRoute(
    path: '/onBorading',
    builder: (context, state) => OnboardingView(),
  ),
  GoRoute(
    path: '/SignUp',
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: SignUpView(),
    ),
  ),
  GoRoute(
    path: '/logIn',
    builder: (context, state) => BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: LogInView(),
    ),
  )
]);
