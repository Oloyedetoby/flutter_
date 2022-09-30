import 'package:flutter/cupertino.dart';
import 'package:todo_reloaded/model/note_model.dart';

class NoteProvider extends ChangeNotifier {
  final List<Note> _notes = [
    Note(
        title: "Food",
        note:
            "My best food is beans but i love it cool db yeu stvdkakasduh hsbv 3.	The Vendor hereby agrees to transfer the full and exclusive rights of ownership and enjoyment of the said land to the Purchaser (subject to the Governor’s consent) and that the Purchaser may use the said land for any purpose or in any way he likes for his benefits",
        dateid: "1"),
    Note(
        title: "Country",
        note: "The country I loved most is : I cant really sha ",
        dateid: "2"),
    Note(
        title: "State",
        note:
            "That is the state i havent being too, i love this with my whole hearth",
        dateid: "3"),
    Note(
        title: "Recv",
        note: "Wita of te great flindin with the holdaa",
        dateid: "1"),
  ];
  String _searchnote = '';
  List<Note> get notes => _searchnote.isEmpty
      ? _notes
      : _notes
          .where((item) =>
              item.title.toLowerCase().contains(_searchnote.toLowerCase()))
          .toList();

  void changesearchstring(String searchstring) {
    _searchnote = searchstring;
    notifyListeners();
  }

  void deleteNote(Note note) {
    _notes.remove(note);
    notifyListeners();
  }

  void ondeleteButton(String text, String title) {
    _notes.removeWhere((item) => item.title == title && item.note == text);
    notifyListeners();
  }

  // void check(String testcheck) {
  //   return print("11 $testcheck");
  // }

  void addTodoItem(String dateid, String title, String note) {
    _notes.add(
      Note(
          dateid: DateTime.now().millisecondsSinceEpoch.toString(),
          title: title,
          note: note),
    );
    notifyListeners();
  }

  bool _testfieldfrcheck = false;
  void testcheck(bool teschec) {
    _testfieldfrcheck = !teschec;
    notifyListeners();
  }

  bool get testfieldfrcheck => _testfieldfrcheck;
  //
  var _myTextFocusNode = FocusNode();
  var _myTittleFocusNode = FocusNode();

  ///
  void setTextFocusNode(FocusNode textfocus) async {
    _myTextFocusNode = textfocus;
  }

  FocusNode get myTextFocusNode => _myTextFocusNode;

  ///
  void setTittleFocusNode(FocusNode titlefocus) async {
    _myTittleFocusNode = titlefocus;
  }

  FocusNode get myTittleFocusNode => _myTittleFocusNode;

  
}
