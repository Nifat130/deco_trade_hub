import 'dart:io';

import 'package:deco_trade_hub/core/utils/constants/app_colors.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/features/store/presentation/controllers/store_controller.dart';
import 'package:deco_trade_hub/ui/widgets/global/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constants/icon_path.dart';
import '../../../../ui/nifat/widgets/custom_button.dart';
import '../../../../ui/nifat/widgets/custom_text.dart';
import '../../../../ui/nifat/widgets/custom_text_field.dart';
import '../../controllers/wholesaler_product_controller.dart';
import '../../model/product_model.dart';

class AddProductScreen extends GetView<WholesalerProductController> {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: CustomAppBar(title: 'Add New Product'),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // customBackActivityHeader("Add New Product"),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          controller: controller.productName,
                          hintText: "Enter product name",
                          validator: (value) => value == null || value.isEmpty ? "Product name is required" : null,
                          prefixIcon: Image.asset(
                            IconPath.productNameIcon,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
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

                        /// Price field
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

                        /// Toggle buttons for new arrival and offer
                        Obx(() => Row(
                              children: [
                                Checkbox(
                                  value: controller.isNewArrival.value,
                                  onChanged: (val) => controller.isNewArrival.value = val ?? false,
                                ),
                                CustomText(text: "Is New Arrival"),
                                SizedBox(width: 24.w),
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

                        /// Poster image field
                        Obx(() => controller.posterImagePath.value == ""
                            ? Container(
                                width: double.infinity,
                                decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.h), border: Border.all(color: AppColors.borderColor)),
                                padding: EdgeInsets.symmetric(vertical: 32.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 16.h,
                                  children: [
                                    CustomText(
                                      text: "Upload poster image of the product",
                                      color: AppColors.textSecondary,
                                    ),
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

                        /// Description field
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
                                spacing: 8.w,
                                children: [
                                  ...controller.imagePathList.map((imagePath) => ClipRRect(
                                        borderRadius: BorderRadius.circular(8.h),
                                        child: Image.file(
                                          File(imagePath),
                                          height: 80.h,
                                          width: 80.w,
                                        ),
                                      )),
                                  Container(
                                    height: 80.h,
                                    width: 80.w,
                                    decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.h), border: Border.all(color: AppColors.borderColor)),
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.pickProductImage();
                                      },
                                      child: Image.asset(
                                        IconPath.addPictureIcon,
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 24.h,
                        ),
                        GetBuilder<WholesalerProductController>(
                          builder: (productController) {
                            return CustomButton(
                              loading: productController.isLoading,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.addProduct(
                                    productToCreate: ProductModel(
                                        id: 'Id will not be posted in the request',
                                        name: controller.productName.text,
                                        description: controller.fabricType.text,
                                        price: double.tryParse(controller.price.text),
                                        offerPrice: controller.isOnOffer.value ? double.tryParse(controller.offerPrice.text) : null,
                                        // avatarImage: controller.posterImagePath.value,
                                        // productImages: controller.imagePathList.toList(),
                                        category: controller.selectedCategoryName.value,
                                        fabrics: controller.fabricType.text,
                                        clothWidth: double.tryParse(controller.fixedWidth.text),
                                        stockQuantity: int.tryParse(controller.quantity.text),
                                        isTrending: false,
                                        isNewArrival: controller.isNewArrival.value,
                                        isOnOffer: controller.isOnOffer.value,
                                        storeId: Get.find<StoreController>().store?.id ?? ''),
                                  );
                                }
                              },
                              title: "Add Product",
                            );
                          },
                        ),
                        SizedBox(height: 24.h)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
