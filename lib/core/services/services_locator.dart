import 'package:dalel/core/cashe/cashe_helper.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void servicesLocator() {
  getIt.registerSingleton<CasheHelper>(CasheHelper());
}
