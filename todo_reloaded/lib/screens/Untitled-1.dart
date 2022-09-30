
  @override
  void initState() {
    super.initState();

    _myTextFocusNode.addListener(() {
      print('npte has fo9cus ${_myTextFocusNode.hasFocus}');
    });

    _myTittleFocusNode.addListener(() {
      print('title has fo9cus ${_myTittleFocusNode.hasFocus}');
    });

    _mynotetextcontroller.addListener(() {
      final String texttext = _mynotetextcontroller.text;
      print('note ${_mynotetitlecontroller.text.length > 0}');
      _mynotetextcontroller.value = _mynotetextcontroller.value.copyWith(
        text: texttext,
        selection: TextSelection(
            baseOffset: texttext.length, extentOffset: texttext.length),
        composing: TextRange.empty,
      );
    });
    _mynotetitlecontroller.addListener(() {
      final String texttitle = _mynotetitlecontroller.text;
      print('titl ${_mynotetitlecontroller.text.length > 0}');
      _mynotetitlecontroller.value = _mynotetitlecontroller.value.copyWith(
        text: texttitle,
        selection: TextSelection(
            baseOffset: texttitle.length, extentOffset: texttitle.length),
        composing: TextRange.empty,
      );
    });
  }