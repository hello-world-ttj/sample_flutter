import 'package:flutter/material.dart';
import 'package:my_first/main.dart';
import 'package:my_first/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isCheck = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                validator: (value) =>
                    value == null || value.isEmpty ? "Error" : null,
                decoration: const InputDecoration(
                    hintText: "Enter your email", border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _passwordController,
                validator: (value) =>
                    value == null || value.isEmpty ? "Error" : null,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "Enter your password",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: _isCheck,
                      child: const Text(
                        "Something went wrong",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          handleClick(context);
                        }
                      },
                      icon: const Icon(Icons.login),
                      label: const Text("LOGIN"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  handleClick(BuildContext ctx) async {
    final email = _emailController.text;
    final password = _passwordController.text;

    const erroMsg = "User doesn't exist";

    if (email == password) {
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY, true);

      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: (cntx) => const HomeScreen()));
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
        content: Text(erroMsg),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10),
        backgroundColor: Colors.red,
      ));

      showDialog(
          context: ctx,
          builder: (cntx) => AlertDialog(
                title: const Text("Error"),
                content: const Text(erroMsg),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(cntx).pop();
                      },
                      child: const Text("Close"))
                ],
              ));

      setState(() {
        _isCheck = true;
      });
    }
  }
}
