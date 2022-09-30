import 'package:flutter/material.dart';
import 'package:todo_reloaded/provider/note_provider.dart';

class SilverAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(50);
  dynamic bodylistview;
  final String text, hintsearchtext;
  final NoteProvider noteprovii;

  SilverAppBar({
    Key? key,
    required this.text,
    required this.bodylistview,
    required this.hintsearchtext,
    required this.noteprovii,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: ((context, innerBoxIsScrolled) {
        return <Widget>[
          createSilverAppBar1(),
          createSilverAppBar2(), //searchbox
        ];
      }),
      body: bodylistview,
    );
  }

  SliverAppBar createSilverAppBar1() {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: 100,
      title: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          text,
          style: const TextStyle(fontSize: 40),
        ),
      ),
      floating: false,
      pinned: true,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: Container(
            color: Colors.transparent,
          ),
        );
      }),
    );
  }

  SliverAppBar createSilverAppBar2() {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      pinned: true,
      title: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          onChanged: (value) {
            noteprovii.changesearchstring(value);
          },
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(0),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 20.0,
            ),
            prefixIconConstraints: const BoxConstraints(
              maxHeight: 20.0,
              minWidth: 20.0,
            ),
            hintText: 'Search $hintsearchtext',
            hintStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
