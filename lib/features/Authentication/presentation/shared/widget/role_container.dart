import 'package:deco_trade_hub/core/utils/constants/app_colors.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../../ui/nifat/widgets/custom_text.dart';
import '../../controllers/auth_controller.dart';

class RoleContainer extends StatelessWidget {
  final UserRole roleName;
  final String iconPath;

  const RoleContainer({
    Key? key,
    required this.roleName,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.setCurrentRole(roleName);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.sp),
                  color: controller.currentRole.value == roleName ? AppColors.primary : AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(50),
                      spreadRadius: .2,
                      blurRadius: .2,
                      offset: const Offset(.2, .2),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      iconPath,
                      height: 45.h,
                      width: 45.w,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CustomText(
                      text: roleName.value,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: controller.currentRole.value == roleName ? AppColors.white : AppColors.textPrimary,
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
