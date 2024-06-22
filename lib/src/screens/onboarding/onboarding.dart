import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/constants.dart';
import 'package:food_delivery_app/src/screens/authentication/login.dart';
import 'package:food_delivery_app/src/screens/onboarding/components/custom_scroll.dart';
import 'package:food_delivery_app/src/screens/onboarding/pages/first.dart';
import 'package:food_delivery_app/src/screens/onboarding/pages/second.dart';
import 'package:food_delivery_app/src/screens/onboarding/pages/third.dart';
import 'package:food_delivery_app/src/widgets/animated_button.dart';
import 'package:food_delivery_app/src/widgets/custom_text.dart';
import 'package:food_delivery_app/src/widgets/roundedbutton.dart';
import 'package:food_delivery_app/utils/app_color.dart';
import 'package:food_delivery_app/utils/extentions.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  final List<Widget> _pages = [
    const FirstScreen(),
    const SecondScreen(),
    const ThirdScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.onBoardProvider.setPageCount(_pages.length);
    });
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
                physics: CustomScrollPhysics(
                    allowScrolling: context.onBoardProvider.isLastPage),
                controller: _pageController,
                onPageChanged: (index) {
                  context.onBoardProvider.setPage(index);
                  if (index == _pages.length - 1) {
                    setState(() {});
                  }
                },
                children: _pages,
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: _pages.length,
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
                if (context.onBoardProvider.isLastPage) {
                  Get.offAll(() => const Login());
                } else {
                  context.onBoardProvider.nextPage();
                  _pageController.animateToPage(
                    context.onBoardProvider.currentPage,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: CustomButton(
                size: 18,
                title:
                    context.onBoardProvider.isLastPage ? 'Get Started' : 'Next',
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
