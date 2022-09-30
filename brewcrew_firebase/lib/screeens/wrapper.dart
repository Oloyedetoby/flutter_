import 'package:brewcrew_firebase/model/user.dart';
import 'package:brewcrew_firebase/screeens/authenticate/authenticate.dart';
import 'package:brewcrew_firebase/screeens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserM?>(context);
    //return either home or authenticate widget
    if (user == null) {
      return const Authenticate();
    } else {
      return const Home();
    }
  }
}
