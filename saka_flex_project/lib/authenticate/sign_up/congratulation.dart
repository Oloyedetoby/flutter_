import 'package:flutter/material.dart';
import 'package:saka_flex_project/sharedwidget/appbar.dart';
import 'package:saka_flex_project/sharedwidget/containerbutton.dart';
import '../../constants.dart';

class Congratulations extends StatefulWidget {
  const Congratulations({Key? key}) : super(key: key);

  @override
  State<Congratulations> createState() => _CongratulationsState();
}

class _CongratulationsState extends State<Congratulations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(2.0, 40.0, 2.0, 40.0),
              alignment: Alignment.center,
              child: const Text(
                "Congratulations!",
                style: textstyle,
                textAlign: TextAlign.center,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset("assets/authentication/congratulation.jpg"),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(2.0, 50.0, 2.0, 40.0),
              alignment: Alignment.center,
              child: Text(
                  "Congratulations, your flex account has been successfully created",
                  style: textstyle.copyWith(
                      fontStyle: FontStyle.normal, fontSize: 15),
                  textAlign: TextAlign.center),
            ),
            ContainerButton(
                text: 'OK',
                function: () {},
                buttontextcolor: Colors.white,
                buttoncolor: priColor),
          ],
        ),
      ),
    );
  }
}
