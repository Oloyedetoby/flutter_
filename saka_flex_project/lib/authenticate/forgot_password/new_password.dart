import 'package:flutter/material.dart';
import 'package:saka_flex_project/sharedwidget/appbar.dart';
import 'package:saka_flex_project/sharedwidget/containerbutton.dart';
import '../../constants.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPassword();
}

class _NewPassword extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(apptext: 'New password'),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
          child: Column(
            children: [
              const SizedBox(height: 11.0),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10.0),
                child: const Text(
                  'Create a new password to access your account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 18),
                ),
              ),
              const SizedBox(height: 11.0),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 11.0),
                    const Text('New Password', style: textstyle),
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
                    const SizedBox(height: 20.0),
                    const SizedBox(height: 11.0),
                    const Text('Re-enter new password', style: textstyle),
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
                    Text('Must be at least 8 characters',
                        style: textstyle.copyWith(fontSize: 12)),
                    const SizedBox(height: 150.0),
                    ContainerButton(
                        text: 'CREATE PASSWORD',
                        function: () {},
                        buttontextcolor: Colors.white,
                        buttoncolor: priColor),
                    const SizedBox(height: 5.0),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
