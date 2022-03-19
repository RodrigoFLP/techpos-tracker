import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techpos_track/widgets/login_form.dart';
import '../screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  Future<void> _login(
    String email,
    String password,
    BuildContext context,
    Function setCurrentProcess,
  ) async {
    setCurrentProcess();
    UserCredential userC;
    try {
      userC = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      Navigator.popAndPushNamed(context, '/homePage');
    } catch (err) {
      var message = 'Ha ocurrido un error, verifica tus datos';
      if (err.message != null) {
        message = err.message;
      }
      setCurrentProcess();
      Scaffold.of(context).removeCurrentSnackBar();
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginForm(_login),
    );
  }
}
