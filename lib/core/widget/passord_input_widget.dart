import 'package:counter_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:counter_app/core/theme/colors.dart';

class PasswordInputWidget extends StatefulWidget {
  final String labeltext;

  final TextEditingController controller;

  final String? Function(String?)? validator;
  const PasswordInputWidget({
    super.key,
    required this.labeltext,
    required this.controller,
    this.validator,
  });

  @override
  State<PasswordInputWidget> createState() => _PasswordInputWidgetState();
}

class _PasswordInputWidgetState extends State<PasswordInputWidget> {
  bool isNotvisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isNotvisible,
      validator: widget.validator,
      decoration: InputDecoration(
        labelText: widget.labeltext,
        labelStyle: TextStyle(color: AppColors.primaryColor, fontSize: 16),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.secondaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          // Add this
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),

        prefixIcon: Icon(Icons.lock_outline, color: AppColors.primaryColor),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isNotvisible = !isNotvisible;
            });
          },
          icon: Icon(
            isNotvisible ? Icons.visibility_off : Icons.visibility,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
