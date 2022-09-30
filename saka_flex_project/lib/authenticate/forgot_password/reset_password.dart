import 'package:flutter/material.dart';
import 'package:saka_flex_project/sharedwidget/appbar.dart';
import 'package:saka_flex_project/sharedwidget/containerbutton.dart';
import '../../constants.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(apptext: 'Reset password'),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage:
                    AssetImage('assets/authentication/otpveri.jpg'),
                radius: 70,
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'Please enter your username below to reset your password',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Username',
                style: textstyle,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: textInputdecoration.copyWith(
                  hintText: 'e.g johndoe@example.com'),
              validator: (value) {
                return null;
              },
              onChanged: (value) {},
            ),
            const SizedBox(height: 150.0),
            ContainerButton(
                text: 'Submit',
                function: () {},
                buttontextcolor: Colors.white,
                buttoncolor: priColor),
            const SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}
