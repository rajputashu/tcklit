import 'package:flutter/material.dart';
import 'package:tcklit_app/modules/profile/profile_screen.dart';
import 'package:tcklit_app/utils/text_styles.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF8E1),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            children: [
              _appBarWidget(),
              const SizedBox(height: 40),
              Text(
                'TASK FOR TODAY',
                style: AppTextStyle.mediumGreenBold20,
              ),
              const SizedBox(height: 35),
              _questionCardWidget(),
              const SizedBox(height: 30),
              _optionsButtonWidget('Done', Colors.green),
              const SizedBox(height: 8),
              _optionsButtonWidget('Not Done', Colors.lightGreen),
              const SizedBox(height: 8),
              _optionsButtonWidget('Not Yet', Colors.green),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBarWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
              child: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
            const SizedBox(width: 8),
            Text('Hi, Mayank', style: AppTextStyle.mediumGreen17),
          ],
        ),
        const CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(Icons.logout, color: Colors.white),
        ),
      ],
    );
  }

  Widget _questionCardWidget() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 90),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: const Text(
            'Just sit, Relax your body and do whatever you enjoy the most',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
        Positioned(
          top: 0,
          child: Image.asset(
            'assets/images/ic_task_man.png',
            width: 180,
            height: 110,
          ),
        ),
      ],
    );
  }

  Widget _optionsButtonWidget(String text, Color color) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          padding: const EdgeInsets.only(left: 30, top: 12, bottom: 12, right: 30),
        ),
        child: Text(
          text,
          style: AppTextStyle.mediumWhite14,
        ),
      ),
    );
  }

/*Widget _optionsButtonWidget(String text, Color color) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: color,
        side: BorderSide(color: color),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        padding: const EdgeInsets.only(left: 30, top: 12, bottom: 12, right: 30),
      ),
      child: Text(
        text,
        style: AppTextStyle.mediumWhite14,
      ),
    );
  }*/
}
