import 'package:flutter/material.dart';
import 'package:todo_reloaded/provider/note_provider.dart';
import 'package:todo_reloaded/widgets/silverappbar.dart';
import '../creationpage/notecreating.dart';
import 'package:provider/provider.dart';
import 'package:todo_reloaded/constants.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(
      builder: (context, noteProvi, child) => SilverAppBar(
        noteprovii: noteProvi,
        text: ' Note',
        bodylistview: ListView(children: [
          ...noteProvi.notes.map(
            (note) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NoteCreation(
                        tittle: note.title,
                        notte: note.note,
                        noteprovi: noteProvi,
                        texttowhite: false,
                      );
                    },
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.only(
                    top: 7.0, bottom: 7.0, left: 9.0, right: 9.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        tileColor: const Color.fromARGB(31, 196, 170, 170),
                        title: RichText(
                          softWrap: false,
                          text: TextSpan(
                              style: const TextStyle(color: Colors.white),
                              children: [
                                TextSpan(
                                  text: '${note.title}\n',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                TextSpan(
                                  text: note.note,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                )
                              ]),
                        ),
                        trailing: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: tdRed,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: IconButton(
                            onPressed: () => noteProvi.deleteNote(note),
                            icon: const Icon(Icons.delete),
                            iconSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
        hintsearchtext: ' Note',
      ),
    );
  }
}
