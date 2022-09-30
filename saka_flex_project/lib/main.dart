// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:saka_flex_project/authenticate/forgot_password/new_password.dart';
import 'package:saka_flex_project/authenticate/forgot_password/reset_password.dart';
import 'package:saka_flex_project/authenticate/forgot_password/verify_ccount.dart';
import 'package:saka_flex_project/authenticate/sign_in/log_in.dart';
import 'package:saka_flex_project/authenticate/sign_up/congratulation.dart';
import 'package:saka_flex_project/authenticate/sign_up/create_a_transactionpin.dart';
import 'package:saka_flex_project/authenticate/sign_up/create_an_account.dart';
import 'package:saka_flex_project/authenticate/sign_up/onboarding2.dart';
import 'package:saka_flex_project/authenticate/sign_up/onboarding.dart';
import 'package:saka_flex_project/authenticate/sign_up/otp_verification.dart';
import 'package:saka_flex_project/setup_flex_plan/personnal_flex_plan/setup_home.dart';
import './constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: priColor,
      ),
      home: const SetUpHome(),
    );
  }
}
