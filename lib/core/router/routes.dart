import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/views/forgot_password_view.dart';
import 'package:dalel/features/auth/presentation/views/log_in_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel/features/home/presentation/view/home_view.dart';
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
      create: (context) => AuthCubit(),
      child: SignUpView(),
    ),
  ),
  GoRoute(
    path: '/logIn',
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: LogInView(),
    ),
  ),

    GoRoute(
    path: '/forgotPassword',
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: ForgotPasswordView(),
    ),
  ),

  GoRoute(
    path: '/home',
    builder: (context, state) => HomeView(),
  )
]);
