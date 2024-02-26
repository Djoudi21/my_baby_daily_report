import 'package:flutter/material.dart';
import '../../../components/register_form.dart';
import '../../../router/route_generator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  void redirectToLogin() {
    Navigator.of(context).pushReplacementNamed(RouteGenerator.loginPage);
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
              const Text('Inscrivez vous',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              const Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: RegisterForm(),
                  )),
              Expanded(
                  child: GestureDetector(
                      onTap: redirectToLogin,
                      child: const Column(children: [
                        Text('Déja un compte ? '),
                        Text('Connectez vous',
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ])))
            ])));
  }
}
