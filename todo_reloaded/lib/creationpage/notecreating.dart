import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_reloaded/provider/note_provider.dart';

import 'package:intl/intl.dart';

class NoteCreation extends StatefulWidget {
  String notte;
  String tittle;

  final bool texttowhite;
  NoteProvider? noteprovi;

  NoteCreation({
    Key? key,
    this.notte = 'Note Something Down',
    this.tittle = 'Title',
    this.noteprovi,
    required this.texttowhite,
  }) : super(key: key);

  @override
  State<NoteCreation> createState() => _NoteCreationState();
}

class _NoteCreationState extends State<NoteCreation> {
  final _mynotetextcontroller = TextEditingController();
  final _mynotetitlecontroller = TextEditingController();
  final _myTextFocusNode = FocusNode();
  final _myTittleFocusNode = FocusNode();
  final autoFucusIsTrue = true;
  final StreamController _streamController = StreamController();

  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  addData() async {
    _streamController.sink.add(widget.noteprovi!.myTextFocusNode.hasFocus);
  }

  @override
  void initState() {
    super.initState();

    addData();
    _myTextFocusNode.addListener(() async {
      //print('npte has fo9cus ${_myTextFocusNode.hasFocus}');
      widget.noteprovi!.setTextFocusNode(_myTextFocusNode);

      // print(
      //     ' provider npte has fo9cus ${widget.noteprovi!.myTextFocusNode.hasFocus}');
      addData();
    });

    _myTittleFocusNode.addListener(() async {
      //print('title has fo9cus ${_myTittleFocusNode.hasFocus}');
      widget.noteprovi!.setTittleFocusNode(_myTittleFocusNode);

      // print(
      //     'provider title has fo9cus ${widget.noteprovi!.myTittleFocusNode.hasFocus}');
      addData();
    });

    _mynotetextcontroller.addListener(() {
      final String texttext = _mynotetextcontroller.text;
      //print('note ${_mynotetextcontroller.text.length > 0}');

      _mynotetextcontroller.value = _mynotetextcontroller.value.copyWith(
        text: texttext,
        selection: TextSelection(
            baseOffset: texttext.length, extentOffset: texttext.length),
        composing: TextRange.empty,
      );
      addData();
    });
    _mynotetitlecontroller.addListener(() {
      final String texttitle = _mynotetitlecontroller.text;
      //print('titl ${_mynotetitlecontroller.text.length > 0}');
      _mynotetitlecontroller.value = _mynotetitlecontroller.value.copyWith(
        text: texttitle,
        selection: TextSelection(
            baseOffset: texttitle.length, extentOffset: texttitle.length),
        composing: TextRange.empty,
      );
      addData();
    });
  }

  @override
  void dispose() {
    _myTextFocusNode.dispose();
    _myTittleFocusNode.dispose();

    _mynotetextcontroller.dispose();
    _mynotetitlecontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: Text(widget.tittle),
                centerTitle: true,
                elevation: 0,
                actions: [
                  if (_mynotetitlecontroller.text.isNotEmpty ||
                      _mynotetextcontroller.text.isNotEmpty) ...[
                    Container(
                        child: IconButton(
                            onPressed: () {
                              widget.noteprovi!
                                ..addTodoItem(
                                    DateTime.now()
                                        .millisecondsSinceEpoch
                                        .toString(),
                                    _mynotetitlecontroller.text,
                                    _mynotetextcontroller.text);
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.check)))
                  ] else if (!_myTittleFocusNode.hasFocus &&
                      !_myTextFocusNode.hasFocus) ...[
                    const Padding(
                      padding: EdgeInsets.only(right: 25.0),
                      child: Icon(Icons.share),
                    ),
                    PopupMenuButton(
                        onSelected: (value) async {
                          if (value == 0) {
                            widget.noteprovi!.ondeleteButton(
                                _mynotetextcontroller.text,
                                _mynotetitlecontroller.text);

                            final navigator = Navigator.of(context);
                            await Future.delayed(Duration.zero);
                            Navigator.pop(context);
                          }
                        },
                        itemBuilder: (BuildContext context) => [
                              const PopupMenuItem(
                                value: 0,
                                child: Text('Delete'),
                              ),
                            ])
                  ] else ...[
                    Container()
                  ]
                ]),
            body: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Text(formattedDate),
                  TestSpace(
                    noteprovi: widget.noteprovi!,
                    towhite: widget.texttowhite,
                    ffontsize: 30.0,
                    con: _mynotetitlecontroller,
                    hinttext: widget.tittle,
                    myFocusNode: _myTittleFocusNode,
                    autofucus: !autoFucusIsTrue,
                  ),
                  const SizedBox(),
                  TestSpace(
                    noteprovi: widget.noteprovi!,
                    towhite: widget.texttowhite,
                    ffontsize: 20.0,
                    con: _mynotetextcontroller,
                    hinttext: widget.notte,
                    myFocusNode: _myTextFocusNode,
                    autofucus: autoFucusIsTrue,
                  )
                ],
              ),
            ),
          );
        });
  }
}

class TestSpace extends StatelessWidget {
  final NoteProvider noteprovi;
  final bool towhite;
  final double ffontsize;
  final TextEditingController con;
  final String hinttext;
  final FocusNode myFocusNode;
  final bool autofucus;
  TestSpace(
      {Key? key,
      required this.noteprovi,
      required this.towhite,
      required this.ffontsize,
      required this.con,
      required this.hinttext,
      required this.myFocusNode,
      required this.autofucus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: towhite ? autofucus : false,
      focusNode: myFocusNode,
      controller: con,
      style: TextStyle(color: Colors.white, fontSize: ffontsize),
      onChanged: (value) {},
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        prefixIconConstraints: const BoxConstraints(
          maxHeight: 20.0,
          minWidth: 20.0,
        ),
        border: InputBorder.none,
        hintText: hinttext,
        hintStyle: TextStyle(
            color: towhite ? Colors.grey : Colors.white, fontSize: ffontsize),
      ),
    );
  }
}
