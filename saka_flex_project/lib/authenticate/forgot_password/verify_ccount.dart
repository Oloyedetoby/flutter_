import 'package:flutter/material.dart';
import 'package:saka_flex_project/sharedwidget/appbar.dart';
import 'package:saka_flex_project/sharedwidget/containerbutton.dart';
import 'package:saka_flex_project/sharedwidget/textotp_field.dart';
import '../../constants.dart';

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({Key? key}) : super(key: key);

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  double? height;
  double? width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(apptext: 'OTP verification'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/authentication/otpveri.jpg'),
                  radius: 70,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(2.0, 50.0, 2.0, 30.0),
                alignment: Alignment.center,
                child: const Text(
                  "Please enter the one-time password sent to the registered phone **** **** 324",
                  style: textstyle,
                  textAlign: TextAlign.center,
                ),
              ),
              const Text('00:30'),
              SizedBox(
                height: height! / 38,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      TextOTPField(first: true, last: false),
                      TextOTPField(first: true, last: false),
                      TextOTPField(first: true, last: false),
                      TextOTPField(first: true, last: true)
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  const Text(
                    "Didn't receive any code?",
                    style: textstyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Resend New Code?",
                        style:
                            textstyle.copyWith(color: priColor, fontSize: 10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ContainerButton(
                      text: 'Verify',
                      function: () {},
                      buttontextcolor: Colors.white10,
                      buttoncolor: Colors.grey),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
