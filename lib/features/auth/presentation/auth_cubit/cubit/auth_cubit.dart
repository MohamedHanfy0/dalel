import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final auth = FirebaseAuth.instance;
  // final CollectionReference users =
  //     FirebaseFirestore.instance.collection('users');
  late String firstName;
  late String lastName;
  late String emailAddress;
  late String password;
  GlobalKey<FormState> singUpFormState = GlobalKey();
  GlobalKey<FormState> logInFormState = GlobalKey();
  GlobalKey<FormState> forgotPassFormState = GlobalKey();
  bool termsAndConditionCheckBoxValue = false;
  AuthCubit() : super(AuthInitial());

  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(SignupLoadingState());
      // ignore: unused_local_variable
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await addUser();
      await veriFiyAccount();

      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      singUpExcepation(e);
    } catch (e) {
      emit(SignupFailerState(meassage: e.toString()));
    }
  }

  Future<void> signInWithEmailAndPassword() async {
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

  Future<void> veriFiyAccount() async {
    await auth.currentUser!.sendEmailVerification();
  }

  Future<void> addUser() async {
    try {
      CollectionReference collectionReference =
          FirebaseFirestore.instance.collection('users');
      await collectionReference.add({
        'emailAddress': emailAddress,
        'firstName': firstName,
        'lastName': lastName,
      });
    } catch (e) {
      // delteAccount();
    }
  }

  Future<void> delteAccount() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  Future<void> forgotPassword() async {
    try {
      emit(ForgotPassLoadingState());
      await auth.sendPasswordResetEmail(email: emailAddress);
      emit(ForgotPassSuccessState());
    } catch (e) {
      emit(ForgotPassFailerState(meassage: e.toString()));
    }
  }

  void updateConditionCheckBoxValue({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(CheckBoxValueState());
  }

  void singUpExcepation(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(SignupFailerState(meassage: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(SignupFailerState(
          meassage: 'The account already exists for that email.'));
    } else {
      emit(SignupFailerState(meassage: "Check Email and Password!"));
    }
  }
}
