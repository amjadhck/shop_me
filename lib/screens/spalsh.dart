import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_me/main.dart';
import 'package:shop_me/screens/login_screen.dart';
import 'package:shop_me/screens/product_overview_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLoggedIn();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Spalsh"),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> gotoLogin() async {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        Navigator.of(context).pushNamed(LoginScreen.id);
      },
    );
  }

  Future<void> checkLoggedIn() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userName = _sharedPrefs.getString('username');
    final _password = _sharedPrefs.getString('password');
    if (_userName == null ||
        _userName == false && _password == null ||
        _password == false) {
      gotoLogin();
    } else {
      Navigator.of(context).pushReplacementNamed(ProductOverviwScreen.id);
    }
  }
}
