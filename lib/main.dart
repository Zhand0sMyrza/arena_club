import 'package:arena_club/app_main/app_main.dart';
import 'package:arena_club/app_main/bloc/app_main_bloc.dart';
import 'package:arena_club/data/repository/repository.dart';
import 'package:arena_club/firebase_options.dart';
import 'package:arena_club/screens/authorization_screen/src/bloc/auth_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    RepositoryProvider(
      create: (context) => Repository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(context.read<Repository>()),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => AppMainBloc(
              repo: context.read<Repository>(),
              authBloc: context.read<AuthBloc>(),
            )..add(AppStartedEvent()),
          ),
        ],
        child: const AppMain(),
      ),
    ),
  );
}
