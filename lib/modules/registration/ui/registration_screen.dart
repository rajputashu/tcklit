import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:shared_preferences/shared_preferences.dart";
import "package:tcklit_app/modules/registration/registration_bloc.dart";
import "package:tcklit_app/utils/color_constants.dart";
import "package:tcklit_app/utils/preference_keys.dart";
import "package:tcklit_app/utils/text_styles.dart";
import "package:tcklit_app/utils/toast_util.dart";

import "../../../utils/app_enums.dart";
import "../../dashboard/dashboard_screen.dart";

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    var registrationBloc = BlocProvider.of<RegistrationBloc>(context);

    return Scaffold(
      backgroundColor: Colors.green[100],
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Registration',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  _buildTextField('full name', 'Enter full name', registrationBloc),
                  SizedBox(height: 12.0),
                  _buildTextField('email', 'Enter email address', registrationBloc),
                  SizedBox(height: 12.0),
                  _buildTextField('mobile number', 'Enter mobile number', registrationBloc),
                  SizedBox(height: 12.0),
                  _buildTextField('city', 'Enter city', registrationBloc),
                  SizedBox(height: 12.0),
                  Text(
                    'choose plan',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green[300]!),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: BlocBuilder<RegistrationBloc, RegistrationState>(
                      builder: (bContext, state) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isExpanded: true,
                            items: [
                              DropdownMenuItem(
                                value: 'Select',
                                child: Text('Select'),
                              ),
                              DropdownMenuItem(
                                value: 'Basic',
                                child: Text('Basic (₹ 0)'),
                              ),
                              DropdownMenuItem(
                                value: 'Silver',
                                child: Text('Silver (₹ 10/week)'),
                              ),
                              DropdownMenuItem(
                                value: 'Gold',
                                child: Text('Gold (₹ 30/month)'),
                              ),
                            ],
                            onChanged: (value) {
                              registrationBloc.add(ChoosePlanChange(value!));
                            },
                            value: state.choosePlan ?? 'Select',
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      BlocBuilder<RegistrationBloc, RegistrationState>(builder: (bContext, state) {
                        return Checkbox(
                          value: state.isTnCAccepted ?? false,
                          onChanged: (value) {
                            registrationBloc.add(TnCCheckBoxChange(value!));
                          },
                          activeColor: Colors.green,
                        );
                      }),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            text: 'I accept ',
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'T&C',
                                style: TextStyle(
                                  color: Colors.green,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              TextSpan(text: ' and '),
                              TextSpan(
                                text: 'privacy policy',
                                style: TextStyle(
                                  color: Colors.green,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  BlocListener<RegistrationBloc, RegistrationState>(
                    listener: (bc, state) {
                      if (state.apiStatus == ApiStatus.IS_INITIAL) {
                        print('Is initial called');
                      } else if (state.apiStatus == ApiStatus.SUCCESS) {
                        print('Success');
                      } else if (state.apiStatus == ApiStatus.ERROR) {
                        print('Error');
                      }
                    },
                    child: Center(
                      child: SizedBox(
                        width: 180,
                        child: BlocBuilder<RegistrationBloc, RegistrationState>(
                          builder: (bContext, state) {
                            return ElevatedButton(
                              onPressed: () {
                                String? fullName = state.fullName;
                                String? emailId = state.email;
                                String? mobNo = state.mobileNo;
                                String? city = state.city;
                                String? plan = state.choosePlan;
                                bool? isChecked = state.isTnCAccepted;
                                if (fullName == null || fullName.isEmpty) {
                                  ToastUtil.showToast("Enter valid name");
                                } else if (emailId == null || emailId.isEmpty) {
                                  ToastUtil.showToast("Enter valid email id");
                                } else if (mobNo == null || mobNo.isEmpty) {
                                  ToastUtil.showToast("Enter valid mobile number");
                                } else if (city == null || city.isEmpty) {
                                  ToastUtil.showToast("Enter valid city");
                                } else if (plan == null || plan.isEmpty) {
                                  ToastUtil.showToast("Select valid subscription plan");
                                } else if (isChecked == null || !isChecked) {
                                  ToastUtil.showToast("Please select TnC");
                                } else {
                                  _navigateToDashboard();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                // backgroundColor: Colors.green[600],
                                backgroundColor: ColorConstants.buttonBGColor,
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                              child: Text(
                                'Register',
                                style: AppTextStyle.mediumWhite16,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, RegistrationBloc regBloc) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (bContext, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyle.mediumBlackBold17,
            ),
            SizedBox(height: 5.0),
            TextField(
              onChanged: (value) {
                if (label == 'full name') {
                  regBloc.add(FullNameChange(value));
                } else if (label == 'email') {
                  regBloc.add(EmailChange(value));
                } else if (label == 'mobile number') {
                  regBloc.add(MobileNoChange(value));
                } else if (label == 'city') {
                  regBloc.add(CityChange(value));
                }
              },
              decoration: InputDecoration(
                hintText: hint,
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.green[300]!),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.green[500]!),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _navigateToDashboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(PreferenceKeys.isLoginKey, true);

    // registrationBloc.add(RegistrationApiCall());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );
  }
}
