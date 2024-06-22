import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/src/widgets/slidefadeswitcher.dart';
import 'package:food_delivery_app/utils/app_color.dart';

class AuthSwitchButton extends StatelessWidget {
  final bool showSignIn;
  final VoidCallback onTap;

  const AuthSwitchButton({
    super.key,
    required this.showSignIn,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: 2.r, bottom: 60.h),
        child: SlideFadeSwitcher(
          child: showSignIn
              ? Text.rich(
                  TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.mainTextColor,
                      ),
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColor
                                .mainTextColor, // Set your desired color
                          ),
                        ),
                      ]),
                  key: const ValueKey("SignIn"),
                )
              : Text.rich(
                  TextSpan(
                    text: "Do you have an account? ",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.darkOrange,
                    ),
                    children: [
                      TextSpan(
                        text: "Log In",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColor.darkOrange,
                        ),
                      )
                    ],
                  ),
                  key: const ValueKey("SignUp"),
                ),
        ),
      ),
    );
  }
}
