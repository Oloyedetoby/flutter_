import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final String text;
  final Function function;
  final Color buttontextcolor;
  final Color buttoncolor;
  const ContainerButton(
      {Key? key,
      required this.text,
      required this.function,
      required this.buttontextcolor,
      required this.buttoncolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      alignment: Alignment.center,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: buttoncolor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Text(
        '$text',
        style: Theme.of(context).textTheme.button?.copyWith(
            color: buttontextcolor,
            fontWeight: FontWeight.bold,
            fontSize: 15.0),
      ),
    );
  }
}
