import 'package:flutter/material.dart';
import 'package:saka_flex_project/sharedwidget/appbar.dart';
import 'package:saka_flex_project/sharedwidget/containerbutton.dart';
import '../../constants.dart';

class CreateTransactionPin extends StatelessWidget {
  const CreateTransactionPin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(apptext: 'Create a transaction PIN'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/authentication/creatra.jpg'),
                  radius: 70,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(2.0, 50.0, 2.0, 30.0),
                alignment: Alignment.center,
                child: const Text(
                  "Create four(4) digit PIN to secure your transactions",
                  style: textstyle,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Transaction PIN',
                  style: textstyle,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: textInputdecoration.copyWith(
                    hintText: 'e.g Enter 4 digit PIN'),
                validator: (value) {
                  return null;
                },
                onChanged: (value) {},
              ),
              SizedBox(
                height: 50.0,
              ),
              ContainerButton(
                  text: 'Create PIN',
                  function: () {},
                  buttontextcolor: Colors.white10,
                  buttoncolor: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
