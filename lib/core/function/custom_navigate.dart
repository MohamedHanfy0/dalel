import 'package:go_router/go_router.dart';

// ignore: non_constant_identifier_names
void CustomNavigate(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}
