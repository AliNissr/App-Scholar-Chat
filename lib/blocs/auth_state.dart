part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}
// ثاني خطوة في ال Bloc هي تحديد ال State
class AuthInitial extends AuthState {}

class LoginLoaging extends AuthState {}
class LoginSuccess extends AuthState {}
class LoginFailuer extends AuthState {
  String errormassages;
  LoginFailuer({required this.errormassages});
}


class RegisterLoading extends AuthState {}
class RegisterSuccess extends AuthState {}
class RegisterFailuer extends AuthState {
  String errormassage;
  RegisterFailuer({required this.errormassage});
}
