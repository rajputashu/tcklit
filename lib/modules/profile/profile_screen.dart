import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcklit_app/modules/profile/profile_bloc.dart';
import 'package:tcklit_app/modules/profile/ui/plan_option_widget.dart';

import '../../utils/app_enums.dart';
import '../../utils/color_constants.dart';
import '../../utils/text_styles.dart';
import '../../utils/toast_util.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var profileBloc = BlocProvider.of<ProfileBloc>(context);

    return Scaffold(
      // backgroundColor: Colors.green[100],
      appBar: _appBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _textFieldWidget('full name', 'Enter full name', profileBloc),
                SizedBox(height: 12.0),
                _textFieldWidget('email', 'Enter email address', profileBloc),
                SizedBox(height: 12.0),
                _textFieldWidget('mobile number', 'Enter mobile number', profileBloc),
                SizedBox(height: 12.0),
                _textFieldWidget('address', 'Enter address', profileBloc),
                SizedBox(height: 12.0),
                _textFieldWidget('city', 'Enter city', profileBloc),
                SizedBox(height: 12.0),
                _selectedPlanWidget(),
                SizedBox(height: 20.0),
                _planExpirationWidget(),
                SizedBox(height: 30.0),
                BlocListener<ProfileBloc, ProfileState>(
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
                      child: BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (bContext, state) {
                          return ElevatedButton(
                            onPressed: () {
                              String? fullName = state.fullName;
                              String? emailId = state.email;
                              String? mobNo = state.mobileNo;
                              String? address = state.address;
                              String? city = state.city;
                              if (fullName == null || fullName.isEmpty) {
                                ToastUtil.showToast("Enter valid name");
                              } else if (emailId == null || emailId.isEmpty) {
                                ToastUtil.showToast("Enter valid email id");
                              } else if (mobNo == null || mobNo.isEmpty) {
                                ToastUtil.showToast("Enter valid mobile number");
                              } else if (address == null || address.isEmpty) {
                                ToastUtil.showToast("Enter valid address");
                              } else if (city == null || city.isEmpty) {
                                ToastUtil.showToast("Enter valid city");
                              } else {
                                // _navigateToDashboard();
                                ToastUtil.showToast("Profile saved successfully");
                                Navigator.pop(context);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              // backgroundColor: Colors.green[600],
                              backgroundColor: ColorConstants.buttonBGColor,
                              padding: EdgeInsets.only(left: 12.0, right: 12, top: 10, bottom: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            child: Text(
                              'Update Plan',
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
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.green,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text('Profile'),
      centerTitle: true,
    );
  }

  Widget _textFieldWidget(String label, String hint, ProfileBloc regBloc) {
    return BlocBuilder<ProfileBloc, ProfileState>(
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
                } else if (label == 'address') {
                  regBloc.add(AddressChange(value));
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

  Widget _selectedPlanWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Selected plan', style: AppTextStyle.mediumBlackBold16),
        SizedBox(height: 8),
        Row(
          children: [
            PlanOptionWidget(
              icon: Icons.circle,
              color: Colors.green,
              planName: 'Basic',
              price: '₹ 0',
            ),
            SizedBox(width: 16),
            PlanOptionWidget(
              icon: Icons.circle_outlined,
              color: Colors.green,
              planName: 'Silver',
              price: '₹ 10/week',
            ),
            SizedBox(width: 16),
            PlanOptionWidget(
              icon: Icons.circle_outlined,
              color: Colors.green,
              planName: 'Gold',
              price: '₹ 30/month',
            ),
          ],
        ),
      ],
    );
  }

  Widget _planExpirationWidget() {
    return Column(
      children: [
        Text('Plan Expiration Date', style: AppTextStyle.mediumBlackBold16),
        SizedBox(height: 8),
        Text('31-November-2025', style: AppTextStyle.mediumBlack16),
      ],
    );
  }
}
