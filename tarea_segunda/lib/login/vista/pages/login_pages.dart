import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tarea_segunda/user/vista/pages/user_page.dart';
import 'package:tarea_segunda/login/bloc/login_bloc.dart';
import 'package:tarea_segunda/login/bloc/login_event.dart';
import 'package:tarea_segunda/login/bloc/login_state.dart';
import 'package:tarea_segunda/login/vista/views/login_error_view.dart';
import 'package:tarea_segunda/login/vista/views/login_initial_view.dart';
import 'package:tarea_segunda/login/vista/views/login_loading_view.dart';


class LoginPages extends StatelessWidget {
  const LoginPages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('Verifica tu Carro')),
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserPage()),
              );
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return LoginLoadingView();
              } else if (state is LoginError) {
                return LoginErrorView();
              } else {
                return LoginInitialView(
                  onLogin: (email, password) {
                    context.read<LoginBloc>().add(
                      LoginSubmitted(email: email, password: password),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}