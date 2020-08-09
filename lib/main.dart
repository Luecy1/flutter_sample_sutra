import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample_sutra/blocs/authentication/authentication_bloc.dart';
import 'package:flutter_sample_sutra/blocs/authentication/authentication_event.dart';
import 'package:flutter_sample_sutra/repository/hardcode_authentication_repository.dart';
import 'package:flutter_sample_sutra/screen/event_list_screen.dart';
import 'package:flutter_sample_sutra/screen/sign_in_screen.dart';
import 'package:flutter_sample_sutra/screen/splash_screen.dart';

import 'blocs/authentication/authentication_state.dart';

void main() {
  final authenticationRepository = HardcodeAuthenticationRepository();

  runApp(
    BlocProvider<AuthenticationBloc>(
      builder: (context) {
        return AuthenticationBloc(authenticationRepository: authenticationRepository)
          ..dispatch(AppStarted());
      },
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.indigo[900],
        accentColor: Colors.pink[800],
        brightness: Brightness.light,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        bloc: authBloc,
        builder: (context, state) {
          if (state is AuthenticationInProgress) {
            return SplashScreen();
          }
          if (state is AuthenticationSuccess) {
            return EventListScreen();
          }
          if (state is AuthenticationFailure) {
            return SignInScreen();
          }
          return Container();
        },
      ),
    );
  }
}
