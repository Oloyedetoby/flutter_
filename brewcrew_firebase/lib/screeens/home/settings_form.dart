import 'package:brewcrew_firebase/model/user.dart';
import 'package:brewcrew_firebase/services/database.dart';
import 'package:brewcrew_firebase/shared/constant.dart';
import 'package:brewcrew_firebase/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  String? _currentName;
  String? _currentsugars;
  int? _currentStrength;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserM>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userdata,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData? userData = snapshot.data;
          return Form(
            key: _formkey,
            child: Column(
              children: [
                const Text(
                  'Update Your Brew Seetings.',
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(height: 20.0),

                TextFormField(
                  initialValue: userData?.name,
                  decoration:
                      textInputdecoration.copyWith(hintText: 'input name'),
                  validator: (val) =>
                      val!.isEmpty ? 'Please enter a name' : null,
                  onChanged: (val) {
                    setState(() {
                      _currentName = val;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                //dropdown
                DropdownButtonFormField(
                  decoration: textInputdecoration,
                  value: _currentsugars ?? userData?.sugar,
                  items: sugars.map((sugar) {
                    return DropdownMenuItem(
                        value: sugar, child: Text('$sugar sugars'));
                  }).toList(),
                  onChanged: (val) =>
                      setState(() => _currentsugars = val as String?),
                ),
                const SizedBox(height: 20.0),
                //sider
                Slider(
                  min: 100.0,
                  max: 900.0,
                  activeColor: Colors
                      .brown[_currentStrength ?? userData?.strength as int],
                  inactiveColor: Colors.brown[_currentStrength ?? 100],
                  value: (_currentStrength ?? 100).toDouble(),
                  onChanged: (val) =>
                      setState(() => _currentStrength = val.round()),
                ),
                const SizedBox(height: 20.0),
                TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.pink[400])),
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        await DatabaseService(uid: user.uid).updateUserData(
                            _currentsugars ?? userData?.sugar as String,
                            _currentName ?? userData?.name as String,
                            _currentStrength ?? userData?.strength as int);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Update'))
              ],
            ),
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
