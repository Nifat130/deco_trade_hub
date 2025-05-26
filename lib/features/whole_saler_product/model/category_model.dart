class CategoryModel {
  final String id;
  final String name;
  final String? parentId;

  CategoryModel({required this.id, required this.name, this.parentId});

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'],
      name: map['name'],
      parentId: map['parent_category_id'],
    );
  }
}
