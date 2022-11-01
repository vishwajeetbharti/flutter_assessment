part of 'auth_bloc.dart';

abstract class AuthBlocEvent {}

class SignUp extends AuthBlocEvent {
  String email, password;
  SignUp({required this.email, required this.password});
}

class LogIn extends AuthBlocEvent {
  String email, password;
  LogIn({required this.email, required this.password});
}
