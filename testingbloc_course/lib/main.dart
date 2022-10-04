import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'dart:math' as math show Random;

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

const names = ['foo', 'goo', 'soo'];

//create an generic extension iterable of anything that that generate a random element from that iterable
extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

///The cubit
class NameCubit extends Cubit<String?> {
  NameCubit() : super(null);

  void pickRandomName() => emit(names.getRandomElement());
}

///

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final NameCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = NameCubit();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: StreamBuilder(
        stream: cubit.stream,
        builder: (context, snapshot) {
          final button = TextButton(
              onPressed: () => cubit.pickRandomName(),
              child: const Text('Pick a random Name'));
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return button;
            case ConnectionState.waiting:
              return button;
            case ConnectionState.active:
              return Column(
                children: [
                  Text(snapshot.data as String),
                  button,
                ],
              );
            case ConnectionState.done:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
