import 'package:dalel/core/cashe/cashe_helper.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void servicesLocator() {
  getIt.registerSingleton<CasheHelper>(CasheHelper());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
}
