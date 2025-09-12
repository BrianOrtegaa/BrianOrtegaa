import 'package:flutter/material.dart';

class LoginInitialView extends StatelessWidget {
  final void Function(String email, String password) onLogin;

  const LoginInitialView({super.key, required this.onLogin});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Correo'),
          ),
          SizedBox(height: 16),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Contraseña'),
          ),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              onLogin(emailController.text, passwordController.text);
            },
            child: Text('Iniciar sesión'),
          ),
        ],
      ),
    );
  }
}
