import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tarea_segunda/login/vista/pages/login_pages.dart';

import '../../bloc/user_bloc.dart';
import '../../bloc/user_event.dart';
import '../../bloc/user_state.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBloc()..add(UserFetchData()),
      child: Scaffold(
        appBar: AppBar(

  leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.black),
    onPressed:() {
      Navigator.pop(context); // 🔙 vuelve a la página anterior
    },
  ),
),

      
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  const Text(
        'Carro de usuario',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
                const SizedBox(height: 40),
                SizedBox(
                  
                width: 350,
                height: 220,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15), // pon 0 si no quieres bordes redondeados
                  child: Image.asset(
                    'assets/images/ferrari.jpg',
                    fit: BoxFit.cover, // ajusta la imagen al contenedor
                  ),
                ),
              ),

              SizedBox(height: 20),

              Text(
                'BIENVENIDO, Este es tu Ferrari personalizado',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              // BlocBuilder
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoading) {
                    return Text(
                      'Cargando...',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  } else if (state is UserError) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Error al cargar',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            context.read<UserBloc>().add(UserFetchData());
                          },
                          child: Text('Reintentar'),
                        ),
                      ],
                    );
                  } else if (state is UserLoaded) {
                    return Text(
                      state.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }

                  return Text(
                    'No data',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  );
                },
              ),

              Text(
                'Disfruta de la velocidad y el estilo',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}