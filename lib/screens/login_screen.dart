import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen.dart';

class LogInscreen extends StatefulWidget {
  const LogInscreen({Key? key}) : super(key: key);

  @override
  State<LogInscreen> createState() => _LogInscreenState();
}

class _LogInscreenState extends State<LogInscreen> {
  final AuthBloc _authBloc = AuthBloc();
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController passwordcontrol = TextEditingController();

  void validEmail() {
    final bool isvalid = EmailValidator.validate(emailcontrol.text.trim());
    if (isvalid) {
      _authBloc
          .add(LogIn(email: emailcontrol.text, password: passwordcontrol.text));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Not valid Email"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => _authBloc,
        child: BlocConsumer<AuthBloc, AuthBlocState>(
          listener: (context, state) {
            if (state is Loginunsuccessfullstate) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.text),
                backgroundColor: Colors.red,
              ));
            } else if (state is Loginsuccessfullstate) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Home()),
                  (Route<dynamic> route) => false);
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: emailcontrol,
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: passwordcontrol,
                    decoration: const InputDecoration(hintText: "Password"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      validEmail();
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.black, fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
