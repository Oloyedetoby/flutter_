import 'package:brewcrew_firebase/screeens/authenticate/register.dart';
import 'package:brewcrew_firebase/screeens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleview() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toggleview: toggleview);
    } else {
      return Register(
          toggleview: toggleview); //Register(toggleview: toggleview);
    }
  }
}
