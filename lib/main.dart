import 'package:dalel/app/dalel.dart';
import 'package:dalel/core/cashe/cashe_helper.dart';
import 'package:dalel/core/function/check_user_state.dart';
import 'package:dalel/core/services/services_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  servicesLocator();
  await getIt<CasheHelper>().init();
  checkUserState();
  runApp(const Dalel());
}
 