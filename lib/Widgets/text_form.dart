import 'package:flutter/material.dart';
import 'app_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String hintText;
  final double? width;
  final double? height;
  final Color? borderColor;

  const CustomTextFormField({
    super.key,
    this.label,
    required this.hintText,
    this.width,
    this.height,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) // Conditionally include label
          AppText(
            text: label!,
            textColor: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        if (label != null) // Conditionally include SizedBox for spacing
          const SizedBox(height: 5),
        SizedBox(
          height: height ?? 55,
          width: width ?? double.infinity,
          child: TextFormField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: borderColor ?? Colors.grey, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: borderColor ?? Colors.red, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: borderColor ?? Colors.red, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: borderColor ?? Colors.grey, width: 1.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
