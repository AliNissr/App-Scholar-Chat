part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class LoginInitial extends AuthState {}
class LoginLoaging extends AuthState {}
class LoginSuccess extends AuthState {}
class LoginFailuer extends AuthState {
  String errormassages;
  LoginFailuer({required this.errormassages});
}

class RegisterInitial extends AuthState {}
class RegisterLoading extends AuthState {}
class RegisterSuccess extends AuthState {}
class RegisterFailuer extends AuthState {
  String errormassage;
  RegisterFailuer({required this.errormassage});
}
