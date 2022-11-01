part of 'auth_bloc.dart';

abstract class AuthBlocState {}

class SignUpState extends AuthBlocState {}

class SignUpsuccessfullstate extends AuthBlocState {
  SignUpsuccessfullstate();
}

class SignUpunsuccessfullstate extends AuthBlocState {
  String text;
  SignUpunsuccessfullstate({required this.text});
}

class Loginsuccessfullstate extends AuthBlocState {
  Loginsuccessfullstate();
}

class Loginunsuccessfullstate extends AuthBlocState {
  String text;
  Loginunsuccessfullstate({required this.text});
}
