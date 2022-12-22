// import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:meta/meta.dart';
//
// part 'login_state.dart';
//
// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitial());
//
//   Future<void> loginUser({required String email , required String password}) async {
//     emit(LoginLoaging());
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       emit(LoginSuccess());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         emit(LoginFailuer(errormassages: 'No user found for that email.'));
//       } else if (e.code == 'wrong-password') {
//         emit(LoginFailuer(errormassages:  'Wrong password provided for that user.'));
//       }
//       }catch(e) {
//       emit(LoginFailuer(errormassages: "The Password and Email Togather wrong"));
//     }
//   }
// }

//هنا تم عمل AuthCubit الى كل من اللوكن وال رجستر اي مناك بعض الصفحات اقوم بعمل لها Cubit مشترك
// في هذا التطبيق في بدايه قمت بعمل لكل صفحه Cubit خاص فيها
// اما الان قمت بلغاء كل من كيوبت لوكن والرجستر وقمت بالدمجهن في كيوبت اال AuthCubit