part of 'auth_cubit.dart';


sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class SignupLoadingState extends AuthState {}
final class SignupSuccessState extends AuthState {}
final class SignupFailerState extends AuthState {
  SignupFailerState({required this.meassage});
  String meassage;
}


final class CheckBoxValueState extends AuthState {}
// final class CheckBoxValueState extends AuthState {}
