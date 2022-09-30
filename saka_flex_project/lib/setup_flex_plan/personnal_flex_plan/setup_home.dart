import 'package:flutter/material.dart';
import 'package:saka_flex_project/setup_flex_plan/personnal_flex_plan/create_flex_plan.dart';
import 'package:saka_flex_project/sharedwidget/colorbutton.dart';
import 'package:saka_flex_project/sharedwidget/containerbutton.dart';
import '../../../constants.dart';

class SetUpHome extends StatelessWidget {
  const SetUpHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    void _showSettingPanel(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (conteSxt) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: const CreateFlexPlaNShowSettingPanel(),
            );
          });
    }

    //
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/set_upflex_plan/tajmahal.jpeg'),
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
                Color.fromARGB(199, 248, 241, 241),
                Color.fromARGB(68, 235, 245, 244),
                Color.fromARGB(0, 255, 255, 255),
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ColoredButton(
                  leading: 'assets/set_upflex_plan/NotificationBell1.png',
                  text: 'Create a Flex plan',
                  trail: 'assets/set_upflex_plan/arrowright1.png',
                  concolor: Color.fromRGBO(180, 228, 225, 206),
                  funct: () => _showSettingPanel(context),
                  textcolor: Colors.black,
                ),
                ColoredButton(
                  leading: 'assets/set_upflex_plan/NotificationBell2.png',
                  text: 'Join a Flex',
                  trail: 'assets/set_upflex_plan/arrowright2.png',
                  concolor: Color.fromARGB(70, 185, 174, 223),
                  funct: () => print('pressed 2'),
                  textcolor: Colors.black,
                ),
                ColoredButton(
                  leading: 'assets/set_upflex_plan/NotificationBell3.png',
                  text: 'Find fun event',
                  trail: 'assets/set_upflex_plan/arrowright3.png',
                  concolor: Color.fromARGB(110, 153, 187, 255),
                  funct: () => print('pressed 3'),
                  textcolor: Colors.black,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
