import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user/presentation/page/user_page.dart';
import '../../bloc/login_bloc.dart';
import '../../bloc/login_event.dart';
import '../../bloc/login_state.dart';
import '../views/login_error_view.dart';
import '../views/login_initial_view.dart';
import '../views/login_loading_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => UserPage()),
              );
            }
          },
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
    );
  }
}
