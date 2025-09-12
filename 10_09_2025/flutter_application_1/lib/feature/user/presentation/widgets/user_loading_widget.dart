import 'package:flutter/material.dart';

class UserLoadingWidget extends StatelessWidget {
  const UserLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.blue[600]!,
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Cargando información...',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}