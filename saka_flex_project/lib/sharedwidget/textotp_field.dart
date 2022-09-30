import 'package:flutter/material.dart';
import '../constants.dart';

class TextOTPField extends StatefulWidget {
  final bool? first, last;
  const TextOTPField({Key? key, this.first, this.last}) : super(key: key);

  @override
  State<TextOTPField> createState() => _TextOTPFieldState();
}

class _TextOTPFieldState extends State<TextOTPField> {
  double? height;
  double? width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      height: height! / 12,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && widget.last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && widget.first == false) {
              FocusScope.of(context).previousFocus();
            }
          },

          //readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: textInputdecoration.copyWith(counter: Offstage()),
        ),
      ),
    );
  }
}
