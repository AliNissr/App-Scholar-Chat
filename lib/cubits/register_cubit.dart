// import 'package:bloc/bloc.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:meta/meta.dart';
//
// part 'register_state.dart';
//
// class RegisterCubit extends Cubit<RegisterState> {
//   RegisterCubit() : super(RegisterInitial());
//
//   Future<void> registeruser(
//       {required String email, required String password}) async {
//     emit(RegisterLoading());
//     try {
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       emit(RegisterSuccess());
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         emit(RegisterFailuer(errormassage: 'The password provided is too weak.'));
//       } else if (e.code == 'email-already-in-use') {
//         emit(RegisterFailuer(errormassage: 'The account already exists for that email.'));
//       }
//     } catch (e) {
//       emit(RegisterFailuer(errormassage: 'the Email fail'));
//     }
//   }
// }

//هنا تم عمل AuthCubit الى كل من اللوكن وال رجستر اي مناك بعض الصفحات اقوم بعمل لها Cubit مشترك
// في هذا التطبيق في بدايه قمت بعمل لكل صفحه Cubit خاص فيها
// اما الان قمت بلغاء كل من كيوبت لوكن والرجستر وقمت بالدمجهن في كيوبت اال AuthCubit