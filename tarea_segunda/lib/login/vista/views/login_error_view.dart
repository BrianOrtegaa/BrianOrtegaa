import 'package:flutter/material.dart';

class LoginErrorView extends StatelessWidget {
  const LoginErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Error al iniciar sesión", style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}