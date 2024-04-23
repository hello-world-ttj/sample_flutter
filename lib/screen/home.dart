import 'package:flutter/material.dart';
import 'package:my_first/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                signOut(context);
              },
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: const SafeArea(child: Center(child: Text("Home Screen"))),
    );
  }

  signOut(BuildContext context) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => LoginScreen()), (route) => false);
  }
}
