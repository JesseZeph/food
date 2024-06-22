import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ReuseableText extends StatelessWidget {
  const ReuseableText({super.key, required this.text, required this.style});

  final String text;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      softWrap: false,
      textAlign: TextAlign.left,
      overflow: TextOverflow.fade,
      style: style,
    );
  }
}

TextStyle appStyle(double size, Color color, FontWeight fw) {
  return GoogleFonts.karla(fontSize: size.sp, color: color, fontWeight: fw);
}
