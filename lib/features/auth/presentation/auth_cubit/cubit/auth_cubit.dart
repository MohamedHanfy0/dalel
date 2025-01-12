import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  late String firstName;
  late String lastName;
  late String emailAddress;
  late String password;
  GlobalKey<FormState> singUpFormState = GlobalKey();
  GlobalKey<FormState> logInFormState = GlobalKey();
  bool termsAndConditionCheckBoxValue = false;
  AuthCubit() : super(AuthInitial());

  signUpWithEmailAndPassword() async {
    try {
      emit(SignupLoadingState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      veriFiyAccount();
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignupFailerState(meassage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignupFailerState(
            meassage: 'The account already exists for that email.'));
      } else {
        emit(SignupFailerState(meassage: "Check Email and Password!"));
      }
    } catch (e) {
      emit(SignupFailerState(meassage: e.toString()));
    }
  }

  signInWithEmailAndPassword() async {
    try {
      emit(SingInLoadingState());
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailerState(meassage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailerState(
            meassage: 'Wrong password provided for that user.'));
      } else {
        emit(SignInFailerState(meassage: "Check Email and Password!"));
      }
    }
  }

  veriFiyAccount() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  updateConditionCheckBoxValue({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(CheckBoxValueState());
  }
}
