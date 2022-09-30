import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selecttHandler;
  //final VoidCallback selecttHandler;
  final String answerText;
  const Answer(this.selecttHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //container
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => selecttHandler(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
          padding: MaterialStateProperty.all(const EdgeInsets.all(50)),
          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 30)),
        ),
        child: Text(answerText),
      ),
    );
  }
}
