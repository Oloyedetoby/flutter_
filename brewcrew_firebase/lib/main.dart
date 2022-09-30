import 'package:brewcrew_firebase/model/user.dart';
import 'package:brewcrew_firebase/screeens/wrapper.dart';
import 'package:brewcrew_firebase/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserM?>.value(
      value: AuthServices().userstream,
      initialData: null,
      catchError: (_, __) => null,
      child: const MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
