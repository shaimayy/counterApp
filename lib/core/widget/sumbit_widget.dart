import 'package:flutter/material.dart';
import 'package:counter_app/core/theme/colors.dart';

class SumbitButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const SumbitButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // ← rounds the corners
        ),
        minimumSize: Size(double.infinity, 56), // full width, tall button
        padding: EdgeInsets.all(16),
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontSize: 18)),
    );
  }
}
