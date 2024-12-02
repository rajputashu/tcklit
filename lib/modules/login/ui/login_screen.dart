import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcklit_app/modules/login/login_bloc.dart';
import 'package:tcklit_app/utils/app_enums.dart';

import '../../../common_widgets/custom_app_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var loginBloc = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      appBar: CustomAppBar(
        title: "Login Screen",
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<LoginBloc, LoginState>(builder: (bContext, state) {
              return TextFormField(
                initialValue: state.email,
                onChanged: (value) =>
                    // context.read<LoginBloc>().add(EmailChange(value)),
                    loginBloc.add(EmailChange(value)),
                decoration: const InputDecoration(
                  label: Text('Enter email'),
                  border: OutlineInputBorder(),
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: BlocBuilder<LoginBloc, LoginState>(builder: (bcontext, state) {
              return TextFormField(
                initialValue: state.password,
                onChanged: (value) =>
                    // context.read<LoginBloc>().add(PasswordChange(value)),
                    loginBloc.add(PasswordChange(value)),
                decoration: const InputDecoration(
                  label: Text('Enter password'),
                  border: OutlineInputBorder(),
                ),
              );
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocListener<LoginBloc, LoginState>(
            listener: (bContext, state) {
              //Validate the reponse or handle the response like status Code 200
              if (state.apiStatus == ApiStatus.IS_INITIAL) {
                print('Is initial called');
              } else if (state.apiStatus == ApiStatus.SUCCESS) {
                print('Success');
              } else if (state.apiStatus == ApiStatus.ERROR) {
                print('Error');
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(builder: (bcontext, state) {
              return ElevatedButton(
                  // onPressed: () => context.read<LoginBloc>().add(LoginApiCall()),
                  onPressed: () => loginBloc.add(LoginApiCall()),
                  child: const Text('Login'));
            }),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<LoginBloc, LoginState>(builder: (bc, state) {
            return Text("Email : ${state.email} & Password : ${state.password}");
          })
        ],
      ),
    );
  }
}
