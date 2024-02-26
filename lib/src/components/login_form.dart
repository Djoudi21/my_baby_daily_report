import 'package:flutter/material.dart';
import '../providers/auth_provider.dart';
import '../router/route_generator.dart';
import '../components/atomics/base_input.dart';
import '../components/atomics/base_button.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  String? emailInputErrorMessage;
  String? passwordInputErrorMessage;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void validateForm() {
    var isEmailValid = validateEmailInput(emailController.text);
    var isPasswordValid = validatePasswordInput(passwordController.text);

    if (isEmailValid && isPasswordValid) {
      // Trigger login and pass a completion callback
      Provider.of<AuthProvider>(context, listen: false)
          .login(emailController.text, passwordController.text, context,
              (errorMessage) {
        if (errorMessage.isEmpty) {
          Navigator.of(context)
              .pushReplacementNamed(RouteGenerator.protectedPages);
        } else {
          Fluttertoast.showToast(
              msg: errorMessage,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 2,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      });
    }
  }

  bool validateEmailInput(String value) {
    if (value.isEmpty) {
      setState(() {
        emailInputErrorMessage = 'Veuillez renseigner votre email';
      });
      return false;
    }

    // Regular expression for email validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      setState(() {
        emailInputErrorMessage = 'Veuillez renseignez un email valide';
      });
      return false;
    }
    setState(() {
      emailInputErrorMessage = null;
    });
    return true; // Validation passed
  }

  bool validatePasswordInput(String value) {
    if (value.isEmpty) {
      setState(() {
        passwordInputErrorMessage = 'Veuillez renseigner un mot de passe';
      });
      return false;
    }
    setState(() {
      passwordInputErrorMessage = null;
    });
    return true; // Validation passed
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: BaseInput(
              isTextObscured: false,
              labelText: 'Email',
              onChanged: validateEmailInput,
              controller: emailController,
              errorMessage: emailInputErrorMessage,
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: BaseInput(
                  controller: passwordController,
                  onChanged: validatePasswordInput,
                  isTextObscured: !_passwordVisible,
                  errorMessage: passwordInputErrorMessage,
                  labelText: 'Mot de passe',
                  suffixIcon: IconButton(
                    color: Colors.black87,
                    icon: Icon(_passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ))),
          BaseButton(
            label: 'Valider',
            onPressed: validateForm,
          ),
        ],
      ),
    );
  }
}
