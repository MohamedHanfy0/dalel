import 'package:go_router/go_router.dart';

void customNavigate(context, String path) {
  GoRouter.of(context).push(path);
}

// ignore: non_constant_identifier_names
void customReplacementNavigate(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}
