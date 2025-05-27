import 'package:deco_trade_hub/features/whole_saler_product/controllers/category_controller.dart';
import 'package:deco_trade_hub/features/whole_saler_product/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorySelectorWidget extends StatelessWidget {
  CategorySelectorWidget({super.key});

  final CategoryController controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Select Category"),
        Obx(() {
          return DropdownButton<CategoryModel>(
            isExpanded: true,
            value: controller.selectedTopCategory.value,
            hint: const Text("Choose Main Category"),
            items: controller.topCategories.map((cat) {
              return DropdownMenuItem(value: cat, child: Text(cat.name));
            }).toList(),
            onChanged: controller.onTopCategorySelected,
          );
        }),
        const SizedBox(height: 10),
        Obx(() {
          if (controller.subCategories.isEmpty) return const SizedBox();
          return DropdownButton<CategoryModel>(
            isExpanded: true,
            value: controller.selectedSubCategory.value,
            hint: const Text("Choose Sub Category"),
            items: controller.subCategories.map((cat) {
              return DropdownMenuItem(value: cat, child: Text(cat.name));
            }).toList(),
            onChanged: controller.onSubCategorySelected,
          );
        }),
        const SizedBox(height: 20),
        Obx(() {
          return Text(
            "Selected: ${controller.selectedTopCategory.value?.name ?? '--'} > ${controller.selectedSubCategory.value?.name ?? '--'}",
          );
        }),
      ],
    );
  }
}
