import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
//import 'package:scholarchat/cubits/auth_cubit.dart';

part 'auth_event.dart';
part 'auth_state.dart';
// ملاحضة مهمة جدا وهي ما معنا ال <AuthEvent , AuthState>
//  معناه الحاجه التي يتسقبلها هي ال AuthEvent . والحاجه التي يخرجه او يبعثه او يطلعة هي ال AuthState
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

   on<AuthEvent>((event, emit) async {
     if (event is LoginEvent) {
       // Future<void> loginUser({required String email , required String password}) async {
       emit(LoginLoaging());
       try {
        await FirebaseAuth.instance
             .signInWithEmailAndPassword(email: event.email , password: event.password);
         emit(LoginSuccess());
       } on FirebaseAuthException catch (e) {
         if (e.code == 'user-not-found') {
           emit(LoginFailuer(errormassages: 'No user found for that email.'));
         } else if (e.code == 'wrong-password') {
           emit(LoginFailuer(
               errormassages: 'Wrong password provided for that user.'));
         }
       } catch (e) {
         emit(LoginFailuer(
             errormassages: "The Password and Email Togather wrong"));
       }
     } else if ( event is RegisterEvent){
       emit(RegisterLoading());
       try {
         await FirebaseAuth.instance
             .createUserWithEmailAndPassword(email: event.email, password: event.password);
         emit(RegisterSuccess());
       } on FirebaseAuthException catch (e) {
         if (e.code == 'weak-password') {
           emit(RegisterFailuer(errormassage: 'The password provided is too weak.'));
         } else if (e.code == 'email-already-in-use') {
           emit(RegisterFailuer(errormassage: 'The account already exists for that email.'));
         }
       } catch (e) {
         emit(RegisterFailuer(errormassage: 'the Email fail'));
       }
     }
   });
  }
}
