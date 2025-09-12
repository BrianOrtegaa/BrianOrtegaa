import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/user_bloc.dart';
import '../../bloc/user_event.dart';

class UserErrorWidget extends StatelessWidget {
  const UserErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.error_outline,
          color: Colors.red[400],
          size: 40,
        ),
        SizedBox(height: 15),
        Text(
          'Error al cargar información',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.red[600],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        ElevatedButton.icon(
          onPressed: () {
            context.read<UserBloc>().add(UserFetchData());
          },
          icon: Icon(Icons.refresh),
          label: Text('Reintentar'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[400],
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ],
    );
  }
}