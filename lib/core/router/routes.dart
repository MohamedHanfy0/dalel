import 'package:dalel/features/auth/presentation/views/log_in_view.dart';
import 'package:dalel/features/auth/presentation/views/sign_up_view.dart';
import 'package:dalel/features/on_boarding/peresentation/views/onboarding_view.dart';
import 'package:dalel/features/splash/presentation/views/splash_view.dart';
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
    builder: (context, state) => SignUpView(),
  ),
  GoRoute(
    path: '/logIn',
    builder: (context, state) => LogInView(),
  )
]);
