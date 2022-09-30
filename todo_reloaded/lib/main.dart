import 'package:flutter/material.dart';
import 'package:todo_reloaded/provider/note_provider.dart';

import './widgets/bottomnavigation_widget.dart';
import './creationpage/notecreating.dart';
import 'package:provider/provider.dart';
import './screens/notescreen.dart';
import './screens/todoscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => NoteProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TODO PROJECT VERSION 1.2',
          theme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.green,
          ),
          home: const MyProHome(),
        ));
  }
}

class MyProHome extends StatefulWidget {
  const MyProHome({Key? key}) : super(key: key);

  @override
  State<MyProHome> createState() => _MyProHomeState();
}

class _MyProHomeState extends State<MyProHome> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          NoteScreen(),
          TodoScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            print(currentIndex);
          });
        },
        selectedFontSize: 20.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.notes),
            label: 'Notes',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'To-dos',
            backgroundColor: Colors.green,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                final noteprovii = Provider.of<NoteProvider>(context);
                return NoteCreation(
                  noteprovi: noteprovii,
                  texttowhite: true,
                );
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
