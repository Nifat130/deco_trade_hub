import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/category_model.dart';

class CategoryController extends GetxController implements GetxService {
  final supabase = Supabase.instance.client;

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> topCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> subCategories = <CategoryModel>[].obs;

  Rx<CategoryModel?> selectedTopCategory = Rx<CategoryModel?>(null);
  Rx<CategoryModel?> selectedSubCategory = Rx<CategoryModel?>(null);

  /// getters

  String? get selectedTopCategoryName => selectedTopCategory.value?.name ?? 'Select Category';

  String? get selectedSubCategoryName => selectedSubCategory.value?.name ?? 'Select Sub Category';

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
