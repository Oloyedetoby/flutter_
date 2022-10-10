import 'package:flutter/material.dart';

@immutable
abstract class AppAction {
  const AppAction();
}

@immutable
class LoginAction implements AppAction {
  final String password;
  final String email;

  const LoginAction({
    required this.password,
    required this.email,
  });
}

@immutable
class LoadNotesAction implements AppAction {
  const LoadNotesAction();
}
