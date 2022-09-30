import 'package:flutter/material.dart';
import 'package:saka_flex_project/sharedwidget/containerbutton.dart';
import '../../constants.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/authenticate/onboarding.png'),
                fit: BoxFit.cover,
              ),
              boxShadow: [
                BoxShadow(
                    color: Colors.black54,
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: Offset(3, 7))
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(200, 0, 0, 0),
                  Color.fromARGB(200, 0, 0, 0),
                  Color.fromARGB(0, 0, 0, 0),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 250,
                ),
                Text(
                  'Try dey flex, problem no dey finish',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.white),
                ),
                Text(
                  'Join trips and find fun events near you.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white, fontWeight: FontWeight.normal),
                ),
                ContainerButton(
                    text: 'CREATE AN ACCOUNT',
                    function: () {},
                    buttontextcolor: Colors.white,
                    buttoncolor: priColor),
                ContainerButton(
                    text: 'LOGIN',
                    function: () {},
                    buttontextcolor: Colors.black,
                    buttoncolor: Colors.white)
              ],
            ),
          )
        ],
      ),
    );
  }
}
