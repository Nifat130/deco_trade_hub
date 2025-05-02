// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreModelImpl _$$StoreModelImplFromJson(Map<String, dynamic> json) =>
    _$StoreModelImpl(
      id: json['id'] as String?,
      storeName: json['store_name'] as String?,
      ownerId: json['owner_id'] as String?,
      storeDescription: json['store_description'] as String?,
      storeLogoUrl: json['store_logo_url'] as String?,
      contactNumber: json['contact_number'] as String?,
      email: json['email'] as String?,
      addressLine1: json['address_line1'] as String?,
      addressLine2: json['address_line2'] as String?,
      postalCode: json['postal_code'] as String?,
      storeType: json['store_type'] as String?,
      socialMediaLinks: json['social_media_links'] as Map<String, dynamic>?,
      websiteUrl: json['website_url'] as String?,
      storeBannerUrl: json['store_banner_url'] as String?,
      isVerified: json['is_verified'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      featuredProductId: json['featured_product_id'] as String?,
      nid: json['nid'] as String?,
      tin: json['tin'] as String?,
    );

Map<String, dynamic> _$$StoreModelImplToJson(_$StoreModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'store_name': instance.storeName,
      'owner_id': instance.ownerId,
      'store_description': instance.storeDescription,
      'store_logo_url': instance.storeLogoUrl,
      'contact_number': instance.contactNumber,
      'email': instance.email,
      'address_line1': instance.addressLine1,
      'address_line2': instance.addressLine2,
      'postal_code': instance.postalCode,
      'store_type': instance.storeType,
      'social_media_links': instance.socialMediaLinks,
      'website_url': instance.websiteUrl,
      'store_banner_url': instance.storeBannerUrl,
      'is_verified': instance.isVerified,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'featured_product_id': instance.featuredProductId,
      'nid': instance.nid,
      'tin': instance.tin,
    };
