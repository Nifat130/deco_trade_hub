import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/category_model.dart';

class CategoryController extends GetxController {
  final supabase = Supabase.instance.client;

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> topCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> subCategories = <CategoryModel>[].obs;

  Rx<CategoryModel?> selectedTopCategory = Rx<CategoryModel?>(null);
  Rx<CategoryModel?> selectedSubCategory = Rx<CategoryModel?>(null);

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  Future<void> loadCategories() async {
    final res = await supabase.from('categories').select();
    allCategories.value = (res as List).map((e) => CategoryModel.fromJson(e)).toList();

    topCategories.value = allCategories.where((c) => c.parentId == null).toList();
  }

  void onTopCategorySelected(CategoryModel? category) {
    selectedTopCategory.value = category;
    selectedSubCategory.value = null;

    if (category != null) {
      subCategories.value = allCategories.where((c) => c.parentId == category.id).toList();
    } else {
      subCategories.clear();
    }
  }

  void onSubCategorySelected(CategoryModel? subCat) {
    selectedSubCategory.value = subCat;
  }
}
