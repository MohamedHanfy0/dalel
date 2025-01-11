import 'package:dalel/core/cashe/cashe_helper.dart';
import 'package:dalel/core/router/routes.dart';
import 'package:dalel/core/services/services_locator.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  servicesLocator();
  await getIt<CasheHelper>().init();
  runApp(const Dalel());
}

class Dalel extends StatelessWidget {
  const Dalel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.offWhite),
      routerConfig: router,
    );
  }
}
