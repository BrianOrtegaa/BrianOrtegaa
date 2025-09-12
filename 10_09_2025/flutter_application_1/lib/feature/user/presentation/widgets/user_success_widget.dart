import 'package:flutter/material.dart';

class UserSuccessWidget extends StatelessWidget {
  final String userName;

  const UserSuccessWidget({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      userName,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Colors.blue[700],
      ),
      textAlign: TextAlign.center,
    );
  }
}