import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcklit_app/modules/otp/otp_bloc.dart';

import '../../../utils/app_enums.dart';
import '../../../utils/text_styles.dart';
import '../../../utils/toast_util.dart';

class OTPValidationScreen extends StatefulWidget {
  final String mobileNumber;

  const OTPValidationScreen({super.key, required this.mobileNumber});

  @override
  State<OTPValidationScreen> createState() => _OTPValidationScreenState();
}

class _OTPValidationScreenState extends State<OTPValidationScreen> {
  @override
  Widget build(BuildContext context) {
    var otpBloc = BlocProvider.of<OtpBloc>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/ic_otp_illustration.png',
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
                        Text(
                          style: AppTextStyle.mediumBlack16,
                          textAlign: TextAlign.center,
                          'We have sent an OTP to \n Mobile Number : ${widget.mobileNumber}',
                        ),

                        SizedBox(height: 20),

                        BlocBuilder<OtpBloc, OTPState>(
                          builder: (bContext, state) {
                            return TextField(
                              onChanged: (value) => otpBloc.add(OTPChange(value)),
                              decoration: InputDecoration(
                                labelText: 'OTP',
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
                                LengthLimitingTextInputFormatter(6),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: 20),

                        // Login button
                        BlocListener<OtpBloc, OTPState>(
                          listener: (bc, state) {
                            if (state.apiStatus == ApiStatus.IS_INITIAL) {
                              print('Is initial called');
                            } else if (state.apiStatus == ApiStatus.SUCCESS) {
                              print('Success');
                            } else if (state.apiStatus == ApiStatus.ERROR) {
                              print('Error');
                            }
                          },
                          child: BlocBuilder<OtpBloc, OTPState>(builder: (bContext, state) {
                            return ElevatedButton(
                              onPressed: () {
                                String? enteredOTP = state.otp;
                                if (enteredOTP == null || enteredOTP.isEmpty) {
                                  ToastUtil.showToast(
                                      'Please enter valid OTP sent to ${widget.mobileNumber}');
                                } else if (enteredOTP.length < 6) {
                                  ToastUtil.showToast(
                                      'Please enter valid 6 digit OTP sent to ${widget.mobileNumber}');
                                } else {
                                  otpBloc.add(OTPApiCall());
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
                                  'Verify OTP',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          }),
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
