import 'dart:html';

import 'package:flutter/material.dart';
import 'package:testingbloc_course/models.dart';

@immutable
abstract class NoteApiProtocols {
  const NoteApiProtocols();
  Future<Iterable<Note>?> getnotes({
    required LoginHandle loginHandle,
  });
}

@immutable
class NoteApi implements NoteApiProtocols {
  @override
  Future<Iterable<Note>?> getnotes({required LoginHandle loginHandle}) =>
      Future.delayed(
        const Duration(seconds: 2),
        () => loginHandle == const LoginHandle.foobar() ? mockNotes : null,
      );
}
