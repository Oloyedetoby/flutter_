import 'package:flutter/material.dart';
import 'package:saka_flex_project/sharedwidget/colorbutton.dart';

class CreateFlexPlaNShowSettingPanel extends StatefulWidget {
  const CreateFlexPlaNShowSettingPanel({Key? key}) : super(key: key);

  @override
  State<CreateFlexPlaNShowSettingPanel> createState() =>
      _CreateFlexPlaNShowSettingPanelState();
}

class _CreateFlexPlaNShowSettingPanelState
    extends State<CreateFlexPlaNShowSettingPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(6.0),
            child: const Text(
              'Create a Flex Plan',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(50.0, 10, 50.0, 20),
            child: const Text(
              'Please choose the Flex plan you want to create',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Container(height: 30),
          ColoredButton(
            leading: 'assets/set_upflex_plan/NotificationBell1.png',
            text: 'Create a Flex plan',
            trail: 'assets/set_upflex_plan/arrowright4.png',
            concolor: Colors.white,
            funct: () => print('Big bro'),
            textcolor: Colors.black,
          ),
          ColoredButton(
            leading: 'assets/set_upflex_plan/NotificationBell2.png',
            text: 'Join a Flex',
            trail: 'assets/set_upflex_plan/arrowright4.png',
            concolor: Colors.white,
            funct: () => print('Big bro2'),
            textcolor: Colors.black,
          ),
        ],
      ),
    );
  }
}
