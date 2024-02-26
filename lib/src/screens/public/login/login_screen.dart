import 'package:flutter/material.dart';
import '../../../router/route_generator.dart';
import '../../../components/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  void redirectToRegister() {
    Navigator.of(context).pushReplacementNamed(RouteGenerator.registerPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(40),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(children: [
            const Text(
              'Connectez vous',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black87),
            ),
            const Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: LoginForm(),
                )),
            Expanded(
                child: GestureDetector(
                    onTap: redirectToRegister,
                    child: const Column(children: [
                      Text('Toujours pas de compte ? ',
                          style: TextStyle(color: Colors.black45)),
                      Text('Inscrivez vous',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87))
                    ]))),
          ])),
    );
  }
}
