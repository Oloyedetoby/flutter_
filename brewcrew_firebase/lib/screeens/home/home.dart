import 'package:brewcrew_firebase/model/brew.dart';
import 'package:brewcrew_firebase/screeens/home/brew_list.dart';
import 'package:brewcrew_firebase/screeens/home/settings_form.dart';
import 'package:brewcrew_firebase/services/auth.dart';
import 'package:brewcrew_firebase/services/database.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showSettingPanel(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (conteSxt) {
            return Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: const SettingsForm(),
            );
          });
    }

    final AuthServices _auth = AuthServices();
    return StreamProvider<List<Brew>?>.value(
      value: DatabaseService().brews,
      initialData: null,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: const Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: [
            TextButton.icon(
                onPressed: () async {
                  await _auth.signOut();
                },
                icon: const Icon(Icons.person),
                label: const Text('logout')),
            TextButton.icon(
                onPressed: () => _showSettingPanel(context),
                icon: const Icon(Icons.settings),
                label: const Text('setting')),
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/coffee_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: BrewList()),
      ),
    );
  }
}
