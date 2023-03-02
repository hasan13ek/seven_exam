import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:seven_exam/utils/color.dart';
import 'package:seven_exam/utils/style.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.controller,
    required this.text,
    this.onChanged,
    this.validator,
    this.suffixIcon,
    this.textInputType,
    this.inputFormatters,
    this.isDone = false,
  }) : super(key: key);

  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final FormFieldValidator<String?>? validator;
  final String text;
  final ValueChanged? onChanged;
  bool? isDone;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 20),
            Text(text.tr(),
                style: MyTextStyle.aeonikSemiBold.copyWith(
                     fontSize: 16),),
            Text("*",
                style: MyTextStyle.aeonikBold.copyWith(color: AppColors.error),),
          ],
        ),
        const SizedBox(height: 10),
        Material(
          borderRadius: BorderRadius.circular(30),
          shadowColor: Colors.blue.withOpacity(0.12),
          elevation: 25,
          child: TextFormField(
            textInputAction:
                isDone! ? TextInputAction.done : TextInputAction.next,
            onChanged: onChanged,
            style: MyTextStyle.aeonikSemiBold.copyWith(
                // color: AppColors.neutralBlack,
                fontWeight: FontWeight.w600,
                fontSize: 16),
            obscureText: (text == "Password" || text == "Confirm Password"
                ? true
                : false),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
              controller: controller,
            keyboardType: textInputType,
            decoration: InputDecoration(
              hintText: text,
              contentPadding: const EdgeInsets.only(left: 20),
              hintStyle: MyTextStyle.aeonikSemiBold
                  .copyWith(color: AppColors.neutral7, fontSize: 16),
              suffixIcon: suffixIcon,
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: AppColors.neutral8),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                borderSide: BorderSide(color: AppColors.primary, width: 2),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                borderSide: BorderSide(color: AppColors.error),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                borderSide: BorderSide(color: AppColors.error),
              ),
            ),
            cursorColor: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
