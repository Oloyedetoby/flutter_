import 'package:flutter/material.dart';

class SlverAppBar extends StatelessWidget {
  const SlverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          expandedHeight: 200,
          title: Text('My App Bar'),
          flexibleSpace: FlexibleSpaceBar(
            title: Text('The level'),
            centerTitle: true,
          ),
          leading: Icon(Icons.arrow_back),
          actions: [
            Icon(Icons.settings),
            SizedBox(width: 12),
          ],
        ),
      ],
    );
  }
}
