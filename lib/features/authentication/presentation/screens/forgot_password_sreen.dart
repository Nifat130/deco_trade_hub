import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/common/widgets/custom_outlined_button.dart';
import '../../../../core/common/widgets/custom_submit_button.dart';
import '../../../../core/common/widgets/custom_text.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../routes/app_routes.dart';
////////////////
class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final name = TextEditingController();
  final userRole = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 70.h,),
                CustomText(text: 'DecoTradeHub', fontSize: 24.h,fontWeight: FontWeight.w700, color: AppColors.primary,),
                SizedBox(height: 15.h,),
                CustomText(text: 'Password reset', fontSize: 32.h,fontWeight: FontWeight.w700, color: AppColors.textPrimary,),
                SizedBox(height: 15.h,),
                CustomText(text: "Please enter the OTP that has been sent to your registered email address.", fontSize: 14.h, color: AppColors.textSecondary,),
                SizedBox(height: 80.h,),
                CustomText(text: "Enter the OTP", fontSize: 14.h, color: AppColors.primary,),
                SizedBox(height: 8.h,),
                Pinput(
                  length: 6,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  defaultPinTheme: PinTheme(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(8.sp)
                    ),
                    textStyle: GoogleFonts.dmSans(
                      decorationColor: const Color(0xffA59F92),
                      fontSize: 14.sp,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                  onCompleted: (v){
                    FocusScope.of(context).unfocus();
                  },
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     otpCustomField(name),
                //     otpCustomField(name),
                //     otpCustomField(name),
                //     otpCustomField(name),
                //     otpCustomField(name),
                //     otpCustomField(name),
                //   ],
                // ),
                SizedBox(height: 250.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 8,
                      child: CustomOutlinedButton(onPressed: (){Get.offNamed(AppRoute.loginScreen, arguments: userRole);}, title: "Back", borderColor: AppColors.borderColor, height: 54.h, buttonTextColor: AppColors.primary,),
                    ),
                    Flexible(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    Flexible(
                      flex: 8,
                      child: CustomSubmitButton(text: "Next", onTap: (){Get.offNamed(AppRoute.passwordResetScreen, arguments: userRole);}, borderRadius: BorderRadius.circular(4), padding: EdgeInsets.all(14.h),),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
