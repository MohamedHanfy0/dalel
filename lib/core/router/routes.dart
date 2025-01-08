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
  )
]);
