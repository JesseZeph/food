import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/constants.dart';
import 'package:food_delivery_app/src/screens/authentication/login.dart';
import 'package:food_delivery_app/src/screens/onboarding/pages/first.dart';
import 'package:food_delivery_app/src/screens/onboarding/pages/second.dart';
import 'package:food_delivery_app/src/screens/onboarding/pages/third.dart';
import 'package:food_delivery_app/src/widgets/animated_button.dart';
import 'package:food_delivery_app/src/widgets/custom_text.dart';
import 'package:food_delivery_app/src/widgets/roundedbutton.dart';
import 'package:food_delivery_app/utils/app_color.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    const FirstScreen(),
    const SecondScreen(),
    const ThirdScreen(),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length) {
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Login()),
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.7,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: _pages,
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: const WormEffect(
                dotColor: AppColor.offOrange,
                activeDotColor: AppColor.darkOrange,
                spacing: 12.0,
                dotHeight: 8.0,
                dotWidth: 8.0,
              ),
            ),
            SizedBox(height: 60.h),
            AnimatedButton(
              onTap: () {
                _nextPage();
              },
              child: CustomButton(
                size: 18,
                title:
                    _currentPage == _pages.length - 1 ? 'Get Started' : 'Next',
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.offAll(() => const Login());
                },
                child: const CustomKarlaText(
                  text: 'Skip',
                  size: 18,
                ))
          ],
        ),
      ),
    );
  }
}
