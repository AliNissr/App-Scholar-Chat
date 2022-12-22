part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}
 //  هنا اضع ال حدث الذي يقوم اليوزر بالعمل به . كما موجود في صفحتين ال لوكن وال رجستر فان الحدث في الصفحتين هو الزر التسجيل اي زر (sign in and register)
// اول خطوه في ال Bloc هو انشاء ال Event الحدث
class LoginEvent extends AuthEvent {
 final String email , password;

  LoginEvent({required this.email , required this.password});
}
class RegisterEvent extends AuthEvent {
 final String email , password;

 RegisterEvent({required this.email , required this.password});
}