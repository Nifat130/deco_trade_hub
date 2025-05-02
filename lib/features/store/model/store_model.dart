import 'package:freezed_annotation/freezed_annotation.dart';

part 'store_model.freezed.dart';
part 'store_model.g.dart';

// ignore_for_file: invalid_annotation_target
@freezed
class StoreModel with _$StoreModel {
  const factory StoreModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'store_name') String? storeName,
    @JsonKey(name: 'owner_id') String? ownerId,
    @JsonKey(name: 'store_description') String? storeDescription,
    @JsonKey(name: 'store_logo_url') String? storeLogoUrl,
    @JsonKey(name: 'contact_number') String? contactNumber,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'address_line1') String? addressLine1,
    @JsonKey(name: 'address_line2') String? addressLine2,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'store_type') String? storeType,
    @JsonKey(name: 'social_media_links') Map<String, dynamic>? socialMediaLinks,
    @JsonKey(name: 'website_url') String? websiteUrl,
    @JsonKey(name: 'store_banner_url') String? storeBannerUrl,
    @JsonKey(name: 'is_verified') bool? isVerified,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'featured_product_id') String? featuredProductId,
    @JsonKey(name: 'nid') String? nid,
    @JsonKey(name: 'tin') String? tin,
  }) = _StoreModel;

  factory StoreModel.fromJson(Map<String, dynamic> json) =>
      _$StoreModelFromJson(json);
}

//import 'dart:developer';
//
// class StoreModel {
//   final String? id;
//   final String? storeName;
//   final String? ownerId;
//   final String? storeDescription;
//   final String? storeLogoUrl;
//   final String? contactNumber;
//   final String? email;
//   final String? addressLine1;
//   final String? addressLine2;
//   final String? postalCode;
//   final String? storeType;
//   final Map<String, dynamic>? socialMediaLinks;
//   final String? websiteUrl;
//   final String? storeBannerUrl;
//   final bool? isVerified;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final String? featuredProductId;
//   final String? nid;
//   final String? tin;
//
//   const StoreModel({
//     this.id,
//     this.storeName,
//     this.ownerId,
//     this.storeDescription,
//     this.storeLogoUrl,
//     this.contactNumber,
//     this.email,
//     this.addressLine1,
//     this.addressLine2,
//     this.postalCode,
//     this.storeType,
//     this.socialMediaLinks,
//     this.websiteUrl,
//     this.storeBannerUrl,
//     this.isVerified,
//     this.createdAt,
//     this.updatedAt,
//     this.featuredProductId,
//     this.nid,
//     this.tin,
//   });
//
//   /// Safe Factory Constructor with error catching
//   factory StoreModel.fromJson(Map<String, dynamic> json) {
//     try {
//       return StoreModel(
//         id: json['id'] as String?,
//         storeName: json['store_name'] as String?,
//         ownerId: json['owner_id'] as String?,
//         storeDescription: json['store_description'] as String?,
//         storeLogoUrl: json['store_logo_url'] as String?,
//         contactNumber: json['contact_number'] as String?,
//         email: json['email'] as String?,
//         addressLine1: json['address_line1'] as String?,
//         addressLine2: json['address_line2'] as String?,
//         postalCode: json['postal_code'] as String?,
//         storeType: json['store_type'] as String?,
//         socialMediaLinks: json['social_media_links'] is Map<String, dynamic>
//             ? json['social_media_links'] as Map<String, dynamic>?
//             : (json['social_media_links'] is String
//                 ? _tryDecodeJson(json['social_media_links'] as String?)
//                 : null),
//         websiteUrl: json['website_url'] as String?,
//         storeBannerUrl: json['store_banner_url'] as String?,
//         isVerified: json['is_verified'] as bool?,
//         createdAt: _parseDateTime(json['created_at']),
//         updatedAt: _parseDateTime(json['updated_at']),
//         featuredProductId: json['featured_product_id'] as String?,
//         nid: json['nid'] as String?,
//         tin: json['tin'] as String?,
//       );
//     } catch (e, stackTrace) {
//       log('❌ Error parsing StoreModel', error: e, stackTrace: stackTrace);
//       return const StoreModel(); // return empty fallback object
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'store_name': storeName,
//       'owner_id': ownerId,
//       'store_description': storeDescription,
//       'store_logo_url': storeLogoUrl,
//       'contact_number': contactNumber,
//       'email': email,
//       'address_line1': addressLine1,
//       'address_line2': addressLine2,
//       'postal_code': postalCode,
//       'store_type': storeType,
//       'social_media_links': socialMediaLinks,
//       'website_url': websiteUrl,
//       'store_banner_url': storeBannerUrl,
//       'is_verified': isVerified,
//       'created_at': createdAt?.toIso8601String(),
//       'updated_at': updatedAt?.toIso8601String(),
//       'featured_product_id': featuredProductId,
//       'nid': nid,
//       'tin': tin,
//     };
//   }
//
//   static DateTime? _parseDateTime(dynamic value) {
//     try {
//       if (value == null) return null;
//       return DateTime.tryParse(value.toString());
//     } catch (e, stack) {
//       log("⚠️ DateTime parsing error: $value", error: e, stackTrace: stack);
//       return null;
//     }
//   }
//
//   static Map<String, dynamic>? _tryDecodeJson(String? jsonStr) {
//     try {
//       if (jsonStr == null) return null;
//       return jsonDecode(jsonStr) as Map<String, dynamic>?;
//     } catch (e, stack) {
//       log("⚠️ JSON decoding error: $jsonStr", error: e, stackTrace: stack);
//       return null;
//     }
//   }
// }
