import 'package:deco_trade_hub/core/common/widgets/custom_back_activity_header.dart';
import 'package:deco_trade_hub/core/common/widgets/custom_text.dart';
import 'package:deco_trade_hub/core/common/widgets/custom_text_field.dart';
import 'package:deco_trade_hub/core/utils/constants/app_colors.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/features/Product/controllers/add_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/constants/icon_path.dart';

class AddProductScreen extends GetView<AddProductController> {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customBackActivityHeader("Add New Product"),
            SizedBox(height: 24.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 4.w,
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: Image.asset(IconPath.productNameIcon),
                      ),
                      CustomText(text: "Product Name"),
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  CustomTextField(
                    controller: controller.productName,
                    hintText: "Enter product name",
                  ),
                  SizedBox(height: 16.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 4.w,
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: Image.asset(IconPath.fabricIcon),
                      ),
                      CustomText(text: "Fabric Type"),
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  CustomTextField(
                    controller: controller.fabricType,
                    hintText: "Enter fabric type",
                  ),
                  SizedBox(height: 16.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 4.w,
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: Image.asset(IconPath.productQuantity),
                      ),
                      CustomText(text: "Quantity"),
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  CustomTextField(
                    controller: controller.quantity,
                    hintText: "Enter quantity",
                  ),
                  SizedBox(height: 16.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 4.w,
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: Image.asset(IconPath.takaIcon),
                      ),
                      CustomText(text: "Price"),
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  CustomTextField(
                    controller: controller.price,
                    hintText: "Enter price",
                  ),
                  SizedBox(height: 8.h,),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
