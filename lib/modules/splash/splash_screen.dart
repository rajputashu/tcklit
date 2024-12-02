import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcklit_app/modules/dashboard/dashboard_screen.dart';

import '../../utils/preference_keys.dart';
import '../login_via_mobile/ui/login_via_mobile.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      if (context.mounted) {
        _navigateToLoginOrDashboard(context);
      }
    });

    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          width: 150,
          height: 150,
          'assets/images/ic_splash.png',
        ),
      ),
    );
  }

  void _navigateToLoginOrDashboard(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var loginStatus = prefs.getBool(PreferenceKeys.isLoginKey);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        if (loginStatus == null || !loginStatus) {
          return LoginViaMobile();
        } else {
          return DashboardScreen();
        }
      }),
    );
  }
}
