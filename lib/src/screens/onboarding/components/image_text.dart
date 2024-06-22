import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/custom_text.dart';

class OnBoardingWidget extends StatelessWidget {
  final String image, text, subText;

  const OnBoardingWidget({
    super.key,
    required this.image,
    required this.text,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 100.h),
          child: SvgPicture.asset(image),
        ),
        SizedBox(height: 60.h),
        CustomKarlaText(
          text: text,
          size: 24,
          weight: FontWeight.w900,
        ),
        SizedBox(height: 20.h),
        CustomKarlaText(
          text: subText,
          size: 16,
          weight: FontWeight.w400,
        ),
      ],
    );
  }
}
