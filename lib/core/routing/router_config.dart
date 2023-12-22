import 'package:go_router/go_router.dart';
import 'package:impresso_app/core/routing/page_name.dart';
import 'package:impresso_app/features/auth/presentation/screens/login_screen.dart';
// import 'package:impresso_app/features/onboarding/presentation/onboarding_screen.dart';
import 'package:impresso_app/features/onboarding/presentation/screens/onboarding_screen.dart';

final router = GoRouter(initialLocation: PageName.login, routes: [
  GoRoute(
    path: PageName.login,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: PageName.onboarding,
    builder: (context, state) => const OnboardingScreen(),
  )
]);
