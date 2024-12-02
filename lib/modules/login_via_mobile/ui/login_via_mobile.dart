import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcklit_app/modules/login_via_mobile/login_via_mobile_bloc.dart';
import 'package:tcklit_app/modules/otp/ui/otp_validation_screen.dart';
import 'package:tcklit_app/modules/registration/ui/registration_screen.dart';

import '../../../utils/app_enums.dart';
import '../../../utils/toast_util.dart';

class LoginViaMobile extends StatefulWidget {
  const LoginViaMobile({super.key});

  @override
  State<LoginViaMobile> createState() => _LoginViaMobileState();
}

class _LoginViaMobileState extends State<LoginViaMobile> {
  @override
  Widget build(BuildContext context) {
    var loginBloc = BlocProvider.of<LoginViaMobileBloc>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/ic_mobile_illustration.png',
                  // width: 150,  // Set width as needed
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 50),

                        BlocBuilder<LoginViaMobileBloc, LoginViaMobileState>(
                          builder: (bContext, state) {
                            return TextField(
                              onChanged: (value) => loginBloc.add(MobileChange(value)),
                              decoration: InputDecoration(
                                labelText: 'Mobile Number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 20),

                        // Login button
                        BlocListener<LoginViaMobileBloc, LoginViaMobileState>(
                          listener: (bc, state) {
                            if (state.apiStatus == ApiStatus.IS_INITIAL) {
                              print('Is initial called');
                            } else if (state.apiStatus == ApiStatus.SUCCESS) {
                              print('Success');
                            } else if (state.apiStatus == ApiStatus.ERROR) {
                              print('Error');
                            }
                          },
                          child: BlocBuilder<LoginViaMobileBloc, LoginViaMobileState>(
                              builder: (bContext, state) {
                            return ElevatedButton(
                              onPressed: () {
                                String? enteredMobNo = state.mobileNumber;
                                if (enteredMobNo == null || enteredMobNo.isEmpty) {
                                  ToastUtil.showToast('Please enter valid mobile number');
                                } else if (enteredMobNo.length < 10) {
                                  ToastUtil.showToast('Please enter valid 10 digit mobile number');
                                } else {
                                  // loginBloc.add(LoginApiCall());
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OTPValidationScreen(
                                              mobileNumber: state.mobileNumber!,
                                            )),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        SizedBox(height: 20),

                        Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(color: Colors.grey),
                            children: [
                              TextSpan(
                                text: 'Create One',
                                style: TextStyle(
                                  color: Colors.green,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                                    );
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
