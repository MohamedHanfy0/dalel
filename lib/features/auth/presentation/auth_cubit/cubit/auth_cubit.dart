import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  late String firstName;
  late String lastName;
  late String emailAddress;
  late String password;
  GlobalKey<FormState> formState = GlobalKey();
  bool termsAndConditionCheckBoxValue = false;
  AuthCubit() : super(AuthInitial());

  signUpWithEmailAndPassword() async {
    try {
      emit(SignupLoadingState());
      // ignore: unused_local_variable
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignupFailerState(meassage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignupFailerState(
            meassage: 'The account already exists for that email.'));
      }
    } catch (e) {
      print("----------------------------------");
      print(e.toString());
      emit(SignupFailerState(meassage: e.toString()));
    }
  }

  updateConditionCheckBoxValue({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(CheckBoxValueState());
  }
}
