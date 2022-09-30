import 'package:flutter/material.dart';
import 'package:saka_flex_project/sharedwidget/colorbutton.dart';
import 'package:saka_flex_project/sharedwidget/containerbutton.dart';
import '../../../constants.dart';

class ColoredButton extends StatefulWidget {
  late String? leading;
  final String text;
  final String trail;
  final Color concolor;
  final Color textcolor;
  final Function() funct;
  ColoredButton(
      {Key? key,
      this.leading,
      required this.text,
      required this.trail,
      required this.concolor,
      required this.funct,
      required this.textcolor})
      : super(key: key);

  @override
  State<ColoredButton> createState() => _ColoredButtonState();
}

class _ColoredButtonState extends State<ColoredButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Colors.white,
      child: ListTile(
        onTap: widget.funct,
        tileColor: widget.concolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: Image.asset(widget.leading!),
        title: Text(
          widget.text,
          style: textstyle.copyWith(
            color: widget.textcolor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        trailing: Image.asset(widget.trail),
      ),
    );
  }
}
