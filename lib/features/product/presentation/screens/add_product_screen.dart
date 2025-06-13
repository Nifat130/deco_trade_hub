import 'dart:io';

import 'package:deco_trade_hub/core/common/widgets/clickable_message.dart';
import 'package:deco_trade_hub/core/common/widgets/custom_back_activity_header.dart';
import 'package:deco_trade_hub/core/common/widgets/custom_button.dart';
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customBackActivityHeader("Add New product"),
              SizedBox(height: 24.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        controller: controller.productName,
                        hintText: "Enter product name",
                        prefixIcon: Image.asset(IconPath.productNameIcon, color: AppColors.textSecondary,),
                      ),
                      SizedBox(height: 16.h,),
                      Obx(() =>
                          CustomTextField(
                            controller: controller.categoryName.value,
                            hintText: "Enter product category",
                            readOnly: true,
                            prefixIcon: Image.asset(IconPath.productCategoryIcon, color: AppColors.textSecondary,),
                            suffixIcon: PopupMenuButton(
                                color: AppColors.white,
                                icon: Icon(Icons.keyboard_arrow_down_outlined, color: AppColors.textSecondary,),
                                itemBuilder: (context){
                                  return controller.category.map((element) =>
                                      PopupMenuItem(
                                        child: CustomText(text: element),
                                        onTap: (){
                                          controller.categoryName.value.text = element;
                                          controller.selectedCategoryName.value = element;
                                        },
                                      )
                                  ).toList();
                                }
                            ),
                          )
                      ),
                      SizedBox(height: 16.h,),
                      CustomTextField(
                        controller: controller.fabricType,
                        hintText: "Enter fabric type",
                        prefixIcon: Image.asset(IconPath.fabricIcon, color: AppColors.textSecondary,),
                      ),
                      SizedBox(height: 16.h,),
                      Obx(() =>
                      controller.selectedCategoryName.value != "Pillow Cover" ?
                        CustomTextField(
                          controller: controller.fabricType,
                          hintText: "Enter fixed width (in Inches)",
                          prefixIcon: Image.asset(IconPath.productWidthIcon, color: AppColors.textSecondary,),
                        ) : SizedBox()
                      ),
                      Obx(() =>
                        controller.selectedCategoryName.value == "Pillow Cover" ?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              controller: controller.pillowSizeHeight,
                              hintText: "Enter pillow height (in Inches)",
                              prefixIcon: Image.asset(IconPath.productWidthIcon, color: AppColors.textSecondary,),
                            ),
                            SizedBox(height: 16.h,),
                            CustomTextField(
                              controller: controller.pillowSizeWidth,
                              hintText: "Enter pillow width (in Inches)",
                              prefixIcon: Image.asset(IconPath.productWidthIcon, color: AppColors.textSecondary,),
                            ),
                          ],
                        ) : SizedBox()
                      ),
                      SizedBox(height: 16.h,),
                      CustomTextField(
                        controller: controller.quantity,
                        hintText: "Enter stock limit",
                        keyboardType: TextInputType.number,
                        prefixIcon: Image.asset(IconPath.productQuantityIcon, color: AppColors.textSecondary,),
                      ),
                      SizedBox(height: 16.h,),
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   spacing: 4.w,
                      //   children: [
                      //     SizedBox(
                      //       height: 20.h,
                      //       width: 20.w,
                      //       child: Image.asset(IconPath.takaIcon),
                      //     ),
                      //     CustomText(text: "Price"),
                      //   ],
                      // ),
                      // SizedBox(height: 8.h,),
                      CustomTextField(
                        controller: controller.price,
                        keyboardType: TextInputType.number,
                        hintText: "Enter price",
                        prefixIcon: Image.asset(IconPath.takaIcon, color: AppColors.textSecondary,),
                      ),
                      SizedBox(height: 24.h,),
                      Obx(() =>
                        controller.posterImagePath.value == "" ?
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(8.h),
                              border: Border.all(color: AppColors.borderColor)
                          ),
                          padding: EdgeInsets.symmetric(vertical: 32.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: 16.h,
                            children: [
                              CustomText(text: "Upload poster image of the product", color: AppColors.textSecondary,),
                              GestureDetector(
                                onTap: (){
                                  controller.pickPosterImage();
                                },
                                child: Image.asset(IconPath.addPictureIcon, color: AppColors.textSecondary,),
                              )
                            ],
                          ),
                        ) : Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.h),
                              child: Image.file(File(controller.posterImagePath.value), height: 150.h, width: double.infinity, fit: BoxFit.fill,),
                            ),
                            Positioned(
                              top: 8.h,
                              right: 8.w,
                              child: GestureDetector(
                                onTap: (){
                                  controller.posterImagePath.value = '';
                                },
                                child: Icon(Icons.cancel_rounded, color: AppColors.error.withAlpha(150), size: 32.h,),
                              ),
                            )
                          ],
                        )
                      ),
                      SizedBox(height: 24.h,),
                      CustomTextField(
                        controller: controller.price,
                        keyboardType: TextInputType.number,
                        hintText: "Write about the product...",
                        maxLine: 4,
                      ),
                      SizedBox(height: 24.h,),
                      CustomText(text: "Add more pictures of the product", fontSize: 16.sp, color: AppColors.textSecondary,),
                      SizedBox(height: 16.h,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Obx(() =>
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              spacing: 8.w,
                              children: [
                                ...controller.imagePathList.map((imagePath) =>
                                    Stack(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 12.h, right: 8.w),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8.h),
                                            child: Image.file(File(imagePath), height: 80.h,width: 80.w, fit: BoxFit.fill,),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0.h,
                                          right: -2.w,
                                          child: GestureDetector(
                                            onTap: (){
                                              controller.imagePathList.remove(imagePath);
                                            },
                                            child: Icon(Icons.cancel_rounded, color: Colors.red,),
                                          ),
                                        )
                                      ],
                                    )
                                ),
                                Container(
                                  height: 80.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(8.h),
                                      border: Border.all(color: AppColors.borderColor)
                                  ),
                                  margin: EdgeInsets.only(top: 12.h),
                                  child: GestureDetector(
                                    onTap: (){
                                      controller.pickProductImage();
                                    },
                                    child: Image.asset(IconPath.addPictureIcon, color: AppColors.textSecondary,),
                                  ),
                                )
                              ],
                            )
                        ),
                      ),
                      SizedBox(height: 24.h,),
                      CustomButton(onPressed: (){}, title: "Add product"),
                      SizedBox(height: 24.h,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
