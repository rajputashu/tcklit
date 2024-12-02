import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcklit_app/di/injections_container.dart';
import 'package:tcklit_app/modules/login/login_bloc.dart';
import 'package:tcklit_app/modules/login_via_mobile/login_via_mobile_bloc.dart';
import 'package:tcklit_app/modules/otp/otp_bloc.dart';

import 'modules/profile/profile_bloc.dart';
import 'modules/registration/registration_bloc.dart';
import 'modules/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => locator<LoginBloc>()), // Provide LoginBloc
        BlocProvider<LoginViaMobileBloc>(create: (context) => locator<LoginViaMobileBloc>()),
        BlocProvider<OtpBloc>(create: (context) => locator<OtpBloc>()),
        BlocProvider<RegistrationBloc>(create: (context) => locator<RegistrationBloc>()),
        BlocProvider<ProfileBloc>(create: (context) => locator<ProfileBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TikLit',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(), // Start with SplashScreen
      ),
    );
  }
}

class AppMainPage extends StatefulWidget {
  const AppMainPage({super.key, required this.title});

  final String title;

  @override
  State<AppMainPage> createState() => _AppMainPageState();
}

class _AppMainPageState extends State<AppMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),*/
        // body: const LoginScreen());
        body: const SplashScreen());
  }
}
