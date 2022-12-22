import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Future<void> loginUser({required String email , required String password}) async {
    emit(LoginLoaging());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailuer(errormassages: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailuer(errormassages:  'Wrong password provided for that user.'));
      }
    }catch(e) {
      emit(LoginFailuer(errormassages: "The Password and Email Togather wrong"));
    }
  }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  Future<void> registeruser(
  {required String email, required String password}) async {
  emit(RegisterLoading());
  try {
  await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email, password: password);
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
}

//هنا تم عمل AuthCubit الى كل من اللوكن وال رجستر اي مناك بعض الصفحات اقوم بعمل لها Cubit مشترك
// في هذا التطبيق في بدايه قمت بعمل لكل صفحه Cubit خاص فيها
// اما الان قمت بلغاء كل من كيوبت لوكن والرجستر وقمت بالدمجهن في كيوبت اال AuthCubit