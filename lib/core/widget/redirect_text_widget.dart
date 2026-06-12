import 'package:flutter/material.dart';
import 'package:counter_app/core/theme/colors.dart';

class RedirectTextWidget extends StatelessWidget {
  final String text;
  final String clickabletext;
  final VoidCallback onPressed;
  const RedirectTextWidget({
    super.key,
    required this.text,
    required this.clickabletext,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(color: AppColors.secondaryColor, fontSize: 15),
        ),
        SizedBox(width: 0),
        TextButton(
          onPressed: onPressed,
          child: Text(
            clickabletext,
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
