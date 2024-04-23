import 'package:flutter/material.dart';
import 'package:my_first/main.dart';
import 'package:my_first/screen/home.dart';
import 'package:my_first/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          "https://cdn.iconscout.com/icon/free/png-512/free-whatsapp-42-189793.png?f=webp&w=512",
          scale: 3,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> goToLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => LoginScreen()));
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _loggedKey = _sharedPrefs.getBool(SAVE_KEY);
    if (_loggedKey == null || _loggedKey == false) {
      goToLogin();
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
    }
  }
}
