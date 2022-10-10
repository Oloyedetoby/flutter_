import 'package:flutter/material.dart';

typedef CloseLoadingScreen = bool Function();
typedef UpdateLoadingScreen = bool Function(String);

@immutable
class LoadingScreenControlller {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;

  const LoadingScreenControlller({
    required this.close,
    required this.update,
  });
}
