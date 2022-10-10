import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testingbloc_course/api/login_api.dart';
import 'package:testingbloc_course/api/note_api.dart';
import 'package:testingbloc_course/bloc/actions.dart';
import 'dart:developer' as devtools show log;

import 'package:testingbloc_course/bloc/app_bloc.dart';
import 'package:testingbloc_course/bloc/app_state.dart';
import 'package:testingbloc_course/dialogs/generic_dialogue.dart';
import 'package:testingbloc_course/dialogs/loading_screen.dart';
import 'package:testingbloc_course/models.dart';
import 'package:testingbloc_course/strings.dart';
import 'package:testingbloc_course/views/iterable_list_view.dart';
import 'package:testingbloc_course/views/login_view.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(loginApi: LoginApi(), noteApi: NoteApi()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(homePage),
        ),
        body: BlocConsumer<AppBloc, AppState>(
          builder: (context, appState) {
            final notes = appState.fetchedNotes;
            if (notes == null) {
              return LoginView(
                onLoginTapped: (email, password) {
                  context.read<AppBloc>().add(
                        LoginAction(
                          password: password,
                          email: email,
                        ),
                      );
                },
              );
            } else {
              return notes.toListView();
            }
          },
          listener: (context, appState) {
            //loading screen
            if (appState.isLoading) {
              LoadingScreen.instance().show(
                context: context,
                text: pleaseWait,
              );
            } else {
              LoadingScreen.instance().hide();
            }
            //display possible error
            final loginError = appState.loginError;
            if (loginError != null) {
              showGenericDialog<bool>(
                context: context,
                title: loginErrorDialogTitle,
                content: loginErrorDilogContent,
                optionsBuilder: () => {ok: true},
              );
            }
            //if we are logged In , but we have  no fetched notes, fetch  them now
            if (appState.isLoading == false &&
                appState.loginError == null &&
                appState.loginHandle == const LoginHandle.foobar() &&
                appState.fetchedNotes == null) {
              context.read<AppBloc>().add(
                    const LoadNotesAction(),
                  );
            }
          },
        ),
      ),
    );
  }
}
