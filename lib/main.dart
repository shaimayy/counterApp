import 'package:counter_app/core/helper/observer.dart';
import 'package:counter_app/feature/auth/manager/auth_cubit.dart';
import 'package:counter_app/firebase_options.dart';
import 'package:counter_app/feature/auth/presentation/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(create: (context) => LoginCubit(), child: LoginPage()),
      debugShowCheckedModeBanner: false,
    );
  }
}
