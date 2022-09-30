import 'package:flutter/material.dart';
import 'package:saka_flex_project/sharedwidget/appbar.dart';
import 'package:saka_flex_project/sharedwidget/containerbutton.dart';
import '../../constants.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(apptext: 'Login'),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  'Enter your email and password to login to your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4.0),
                    const Text('Email address', style: textstyle),
                    const SizedBox(height: 3),
                    TextFormField(
                      decoration: textInputdecoration.copyWith(
                          hintText: 'johndoe@example.com'),
                      validator: (value) {
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 11.0),
                    const Text('Password', style: textstyle),
                    const SizedBox(height: 2),
                    TextFormField(
                      obscureText: true,
                      decoration: textInputdecoration.copyWith(
                          hintText: 'e.g Ab123!456',
                          suffixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                            child: GestureDetector(
                              onTap: () {},
                              child: const Icon(Icons.visibility_rounded),
                            ),
                          )),
                      validator: (value) {
                        return null;
                      },
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 13.0),
                    InkWell(
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Forgot Password?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: priColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: ((context) => AlertDialog(
                                title: const Text(
                                    'Confirm fingerprint to continue'),
                                content: Row(
                                  children: <Widget>[
                                    ClipRRect(
                                      //borderRadius: BorderRadius.circular(),
                                      child: Image.asset(
                                          "assets/authentication/biometric2.png"),
                                    ),
                                    const Text('Touch sensor'),
                                  ],
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text('Use Password'),
                                    onPressed: () {},
                                  ),
                                ],
                              )),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                  "assets/authentication/biometric.png"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ContainerButton(
                        text: 'Login',
                        function: () {},
                        buttontextcolor: Colors.white,
                        buttoncolor: priColor),
                    const SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment.center,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 15,
                            ),
                            children: [
                              const TextSpan(
                                text: "Don’t have an account? ",
                              ),
                              TextSpan(
                                text: " Create Account",
                                style: TextStyle(color: priColor),
                              ),
                            ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
