import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/strings.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc() : super(SignUpState()) {
    on<SignUp>((event, emit) async {
      try {
        Response response = await post(Uri.parse(signup),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body:
                jsonEncode({'email': event.email, 'password': event.password}));

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          final signupprefs = await SharedPreferences.getInstance();
          await signupprefs.setString(token, data[token]);
          await signupprefs.setInt(id, data[id]);
          emit(SignUpsuccessfullstate());
        } else {
          var data = jsonDecode(response.body);
          emit(SignUpunsuccessfullstate(text: data['error']));
        }
      } catch (e) {
        throw Exception(e.toString());
      }
    });
    on<LogIn>((event, emit) async {
      try {
        Response response = await post(Uri.parse(login),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body:
                jsonEncode({'email': event.email, 'password': event.password}));

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString(token, data[token]);
          emit(Loginsuccessfullstate());
        } else {
          var data = jsonDecode(response.body);
          emit(Loginunsuccessfullstate(text: data['error']));
        }
      } catch (e) {
        throw Exception(e.toString());
      }
    });
  }
}
