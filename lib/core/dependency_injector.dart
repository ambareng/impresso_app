import 'package:get_it/get_it.dart';
import 'package:impresso_app/features/onboarding/presentation/bloc/onboarding_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => OnboardingBloc());
}
