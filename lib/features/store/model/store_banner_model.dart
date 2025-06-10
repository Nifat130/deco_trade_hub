class StoreBannerModel {
  final String id;
  final String storeName;
  final String? storeBannerUrl;

  StoreBannerModel({
    required this.id,
    required this.storeName,
    this.storeBannerUrl,
  });

  factory StoreBannerModel.fromJson(Map<String, dynamic> json) => StoreBannerModel(
    id: json['id'],
    storeName: json['store_name'],
    storeBannerUrl: json['store_banner_url'],
  );
}