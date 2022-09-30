import 'package:flutter/material.dart';
import 'package:saka_flex_project/sharedwidget/appbar.dart';
import 'package:saka_flex_project/sharedwidget/containerbutton.dart';
import '../../constants.dart';

class CreateAnAccount extends StatelessWidget {
  const CreateAnAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(apptext: 'Create An account'),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(6.0),
              child: const Text(
                'Please enter your information below to create an account',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ),
            Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 9.0),
                const Text('Username', style: textstyle),
                const SizedBox(height: 4),
                TextFormField(
                  decoration:
                      textInputdecoration.copyWith(hintText: 'e.g johndoe'),
                  validator: (value) {
                    return null;
                  },
                  onChanged: (value) {},
                ),
                const SizedBox(height: 15.0),
                const Text('Email address', style: textstyle),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: textInputdecoration.copyWith(
                      hintText: 'e.g johndoe@example.com'),
                  validator: (value) {
                    return null;
                  },
                  onChanged: (value) {},
                ),
                const SizedBox(height: 15.0),
                const Text('Password', style: textstyle),
                const SizedBox(height: 4),
                TextFormField(
                  obscureText: true,
                  decoration: textInputdecoration.copyWith(
                      hintText: 'e.g +23480123445567'),
                  validator: (value) {
                    return null;
                  },
                  onChanged: (value) {},
                ),
                const SizedBox(height: 15.0),
                const Text('Password', style: textstyle),
                const SizedBox(height: 5),
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
                const SizedBox(height: 15.0),
                const Text('Confirm Password', style: textstyle),
                const SizedBox(height: 5),
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
              ],
            )),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 15,
                ),
                children: [
                  const TextSpan(
                    text: "By proceeding I agree to Flex’s",
                  ),
                  TextSpan(
                    text: " Terms of Use ",
                    style: TextStyle(color: priColor),
                  ),
                  const TextSpan(
                    text: "and acknowledge that I have read the",
                  ),
                  TextSpan(
                    text: " Privacy Policy",
                    style: TextStyle(color: priColor),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            ContainerButton(
                text: 'Proceed',
                function: () {},
                buttontextcolor: Colors.white10,
                buttoncolor: Colors.grey),
            const SizedBox(height: 4),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                  ),
                  children: [
                    const TextSpan(
                      text: "Already have an acccount?",
                    ),
                    TextSpan(
                      text: " Login",
                      style: TextStyle(color: priColor),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

const textstyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 15,
);
