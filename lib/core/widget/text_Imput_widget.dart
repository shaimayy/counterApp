import 'package:flutter/material.dart';
import 'package:counter_app/core/theme/colors.dart';

class TextInputWidget extends StatelessWidget {
  final String labeltext;
  final IconData prefixicon;
  final TextEditingController controller;
  // final String? Function(String?)? validator;
  // final TextInputType keyboardType;

  // final VoidCallback? onTap;
  const TextInputWidget({
    super.key,
    required this.labeltext,
    this.prefixicon = Icons.edit,
    required this.controller,
    // this.validator,

    // this.keyboardType = TextInputType.text,
    // this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      // validator: validator,
      // onTap: onTap,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixicon, color: AppColors.primaryColor),
        labelText: labeltext,
        labelStyle: TextStyle(color: AppColors.primaryColor, fontSize: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.secondaryColor, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
