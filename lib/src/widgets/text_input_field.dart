import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/utils/animation/size_fade.dart';
import 'package:food_delivery_app/utils/app_color.dart';

class TextInputField extends StatelessWidget {
  final String hintText;
  final void Function(String value)? onChanged;
  final String? errorText;
  final bool? obscureText;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final double? width;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final Color? borderColor;

  const TextInputField({
    super.key,
    required this.hintText,
    this.onChanged,
    this.errorText,
    this.controller,
    this.obscureText,
    this.validator,
    this.inputType,
    this.width,
    this.suffixIcon,
    this.focusNode,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width ?? 325.w,
          padding: EdgeInsets.only(
            left: 10.w,
          ),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: borderColor ?? AppColor.lightGrey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(8.r)),
          child: TextFormField(
            onChanged: onChanged,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            obscureText: obscureText ?? false,
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              suffixIcon: suffixIcon,
              hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 14.sp,
                  color: AppColor.lightGrey.withOpacity(0.5),
                  fontWeight: FontWeight.w400),
              contentPadding: EdgeInsets.symmetric(vertical: 15.h),
            ),
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: inputType,
          ),
        ),
        SizeFadeSwitcher(
          child: errorText != null
              ? Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 0),
                  child: Text(
                    errorText!,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColor.errorColor),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
