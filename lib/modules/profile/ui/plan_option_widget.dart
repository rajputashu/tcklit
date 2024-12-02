import 'package:flutter/material.dart';
import 'package:tcklit_app/utils/text_styles.dart';

class PlanOptionWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String planName;
  final String price;

  const PlanOptionWidget({
    super.key,
    required this.icon,
    required this.color,
    required this.planName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: color,
              size: 16,
            ),
            SizedBox(width: 4),
            Text(
              planName,
              style: AppTextStyle.mediumBlack15,
            ),
          ],
        ),
        SizedBox(width: 4),
        Text(
          '($price)',
          style: AppTextStyle.mediumBlack14,
        ),
      ],
    );
  }
}
