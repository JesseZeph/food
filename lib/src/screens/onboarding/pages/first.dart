import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/src/screens/onboarding/components/image_text.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: const OnBoardingWidget(
            image: 'assets/images/emptySquare.svg',
            text: 'All your favorites',
            subText:
                "Get all your loved foods in one once place,you just place the orer we do the rest",
          ),
        ),
      ),
    );
  }
}
