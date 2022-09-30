import 'package:flutter/material.dart';
import '../../constants.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: priColor,
      body: Center(
        child: Text(
          'flex',
          style:
              textstyle.copyWith(fontWeight: FontWeight.bold, fontSize: 50.0),
        ),
      ),
    );
  }
}
