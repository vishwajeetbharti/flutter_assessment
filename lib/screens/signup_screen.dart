import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_screen.dart';

class SignUpscreen extends StatefulWidget {
  const SignUpscreen({Key? key}) : super(key: key);

  @override
  State<SignUpscreen> createState() => _SignUpscreenState();
}

class _SignUpscreenState extends State<SignUpscreen> {
  TextEditingController emailcontrol = TextEditingController();
  TextEditingController passwordcontrol = TextEditingController();
  final AuthBloc _authBloc = AuthBloc();

  bool validEmail() {
    final bool isvalid = EmailValidator.validate(emailcontrol.text.trim());
    if (isvalid) {
      return isvalid;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Not valid Email"),
      ));
      return isvalid;
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
            if (state is SignUpunsuccessfullstate) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.text),
                backgroundColor: Colors.red,
              ));
            } else if (state is SignUpsuccessfullstate) {
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
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      bool istrue = validEmail();
                      if (istrue) {
                        _authBloc.add(SignUp(
                            email: emailcontrol.text,
                            password: passwordcontrol.text));
                      }
                    },
                    child: Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Center(
                        child: Text(
                          "Sign Up",
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
