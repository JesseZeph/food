import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/utils/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomKarlaText extends StatelessWidget {
  const CustomKarlaText({
    super.key,
    required this.text,
    this.size,
    this.weight,
    this.align,
    this.overflow,
    this.height,
  });
  final String text;
  final double? size;
  final FontWeight? weight;
  final TextAlign? align;
  final TextOverflow? overflow;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Text(
      text,
      textAlign: align ?? TextAlign.center,
      overflow: overflow ?? TextOverflow.clip,
      style: GoogleFonts.karla(
        fontSize: size?.sp ?? 12.sp,
        fontWeight: weight ?? FontWeight.normal,
        color: theme.bodyMedium?.color ?? AppColor.mainTextColor,
        height: height,
      ),
      softWrap: true,
    );
  }
}
