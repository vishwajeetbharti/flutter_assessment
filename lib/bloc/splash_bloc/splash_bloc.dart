import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/strings.dart';

part 'splash_bloc_event.dart';
part 'splash_bloc_state.dart';

class Loginapi extends Bloc<InitialEvents, InitialState> {
  Loginapi() : super(SplashScreen()) {
    on<CheckSession>((event, emit) async {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.getString(token) != null) {
        emit(HomeScreen());
      }
    });
  }
}
