import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.apptext,
  }) : super(key: key);

  final String? apptext;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      //elevation: 0.0,
      title: Text('$apptext'),
      titleSpacing: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70.0);
}
