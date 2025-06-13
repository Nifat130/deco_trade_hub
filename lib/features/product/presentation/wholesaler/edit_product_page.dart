import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../core/utils/constants/app_sizer.dart';
import '../../../../../core/utils/constants/icon_path.dart';
import '../../../../ui/nifat/widgets/custom_button.dart';
import '../../../../ui/nifat/widgets/custom_text.dart';
import '../../../../ui/nifat/widgets/custom_text_field.dart';
import '../../../../ui/widgets/global/custom_appbar.dart';
import '../../controllers/edit_product_controller.dart';
import '../../controllers/wholesaler_product_controller.dart';
import '../../model/product_model.dart';

class EditProductScreen extends GetView<EditProductController> {
  final ProductModel product;

  EditProductScreen({Key? key, required this.product}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final EditProductController controller = Get.put(EditProductController(product));

    return Scaffold(
      appBar: CustomAppBar(title: 'Edit Product'),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  CustomTextField(
                    controller: controller.productName,
                    hintText: "Enter product name",
                    validator: (value) => value == null || value.isEmpty ? "Product name is required" : null,
                    prefixIcon: Image.asset(
                      IconPath.productNameIcon,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Obx(() => CustomTextField(
                        readOnly: true,
                        controller: controller.categoryName.value,
                        hintText: "Enter product category",
                        validator: (value) => value == null || value.isEmpty ? "Category is required" : null,
                        prefixIcon: Image.asset(
                          IconPath.productCategoryIcon,
                          color: AppColors.textSecondary,
                        ),
                        suffixIcon: PopupMenuButton(
                            color: AppColors.white,
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: AppColors.textSecondary,
                            ),
                            itemBuilder: (context) {
                              return ProductCategory.values
                                  .map((element) => PopupMenuItem(
                                        child: CustomText(text: element.name),
                                        onTap: () {
                                          controller.categoryName.value.text = element.name;
                                          controller.selectedCategoryName.value = element.name;
                                        },
                                      ))
                                  .toList();
                            }),
                      )),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    controller: controller.fabricType,
                    hintText: "Enter fabric type",
                    prefixIcon: Image.asset(
                      IconPath.fabricIcon,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Obx(() => controller.selectedCategoryName.value != ProductCategory.pillowCover.name
                      ? CustomTextField(
                          controller: controller.fixedWidth,
                          hintText: "Enter fixed width (in Inches)",
                          prefixIcon: Image.asset(
                            IconPath.productWidthIcon,
                            color: AppColors.textSecondary,
                          ),
                        )
                      : SizedBox()),
                  Obx(() => controller.selectedCategoryName.value == ProductCategory.pillowCover.name
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              controller: controller.pillowSizeHeight,
                              hintText: "Enter pillow height (in Inches)",
                              prefixIcon: Image.asset(
                                IconPath.productWidthIcon,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            CustomTextField(
                              controller: controller.pillowSizeWidth,
                              hintText: "Enter pillow width (in Inches)",
                              prefixIcon: Image.asset(
                                IconPath.productWidthIcon,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        )
                      : SizedBox()),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    controller: controller.quantity,
                    validator: (value) => value == null || value.isEmpty ? "Stock quantity is required" : null,
                    hintText: "Enter stock limit",
                    numericOnly: true,
                    keyboardType: TextInputType.number,
                    prefixIcon: Image.asset(
                      IconPath.productQuantityIcon,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    controller: controller.price,
                    keyboardType: TextInputType.number,
                    hintText: "Enter price",
                    numericOnlyWithDecimal: true,
                    validator: (value) => value == null || value.isEmpty ? "Price is required" : null,
                    prefixIcon: Image.asset(
                      IconPath.takaIcon,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Obx(() => Row(
                        children: [
                          // Checkbox(
                          //   value: controller.isNewArrival.value,
                          //   onChanged: (val) => controller.isNewArrival.value = val ?? false,
                          // ),
                          // CustomText(text: "Is New Arrival"),
                          // SizedBox(width: 24.w),
                          Checkbox(
                            value: controller.isOnOffer.value,
                            onChanged: (val) => controller.isOnOffer.value = val ?? false,
                          ),
                          CustomText(text: "Is On Offer"),
                        ],
                      )),
                  Obx(() => controller.isOnOffer.value
                      ? CustomTextField(
                          controller: controller.offerPrice,
                          hintText: "Enter offer price",
                          keyboardType: TextInputType.number,
                          numericOnlyWithDecimal: true,
                          prefixIcon: Image.asset(IconPath.takaIcon, color: AppColors.textSecondary),
                          validator: (value) {
                            if (controller.isOnOffer.value) {
                              final offer = double.tryParse(value ?? '');
                              final price = double.tryParse(controller.price.text);
                              if (value == null || value.isEmpty) return "Offer price is required";
                              if (offer == null || offer <= 0) return "Enter valid offer price";
                              if (price != null && offer >= price) return "Offer price must be lower than price";
                            }
                            return null;
                          },
                        )
                      : SizedBox()),
                  SizedBox(height: 24.h),
                  Obx(() => controller.posterImagePath.value == ""
                      ? Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(8.h),
                              border: Border.all(color: AppColors.borderColor)),
                          padding: EdgeInsets.symmetric(vertical: 32.h),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomText(
                                text: "Upload poster image of the product",
                                color: AppColors.textSecondary,
                              ),
                              SizedBox(height: 16.h),
                              GestureDetector(
                                onTap: () {
                                  controller.pickPosterImage();
                                },
                                child: Image.asset(
                                  IconPath.addPictureIcon,
                                  color: AppColors.textSecondary,
                                ),
                              )
                            ],
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(8.h),
                          child: Image.file(
                            File(controller.posterImagePath.value),
                            height: 150.h,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        )),
                  SizedBox(height: 24.h),
                  CustomTextField(
                    expands: true,
                    controller: controller.description,
                    keyboardType: TextInputType.text,
                    hintText: "Write about the product...",
                    maxLine: 4,
                  ),
                  SizedBox(height: 24.h),
                  CustomText(
                    text: "Add more pictures of the product",
                    fontSize: 16.sp,
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(height: 16.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Obx(() => Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ...controller.imagePathList.map((imagePath) => Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      File(imagePath),
                                      height: 100.h,
                                      width: 100.w,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )),
                            GestureDetector(
                              onTap: () {
                                controller.pickProductImage();
                              },
                              child: Container(
                                height: 100.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: AppColors.borderColor)),
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(height: 24.h),
                  Obx(() => controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : CustomButton(
                          title: "Update Product",
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              controller.updateProduct();
                            }
                          },
                        )),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
