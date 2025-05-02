// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoreModel _$StoreModelFromJson(Map<String, dynamic> json) {
  return _StoreModel.fromJson(json);
}

/// @nodoc
mixin _$StoreModel {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_name')
  String? get storeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_id')
  String? get ownerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_description')
  String? get storeDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_logo_url')
  String? get storeLogoUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'contact_number')
  String? get contactNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_line1')
  String? get addressLine1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_line2')
  String? get addressLine2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code')
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_type')
  String? get storeType => throw _privateConstructorUsedError;
  @JsonKey(name: 'social_media_links')
  Map<String, dynamic>? get socialMediaLinks =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'website_url')
  String? get websiteUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'store_banner_url')
  String? get storeBannerUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_verified')
  bool? get isVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'featured_product_id')
  String? get featuredProductId => throw _privateConstructorUsedError;
  @JsonKey(name: 'nid')
  String? get nid => throw _privateConstructorUsedError;
  @JsonKey(name: 'tin')
  String? get tin => throw _privateConstructorUsedError;

  /// Serializes this StoreModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreModelCopyWith<StoreModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreModelCopyWith<$Res> {
  factory $StoreModelCopyWith(
          StoreModel value, $Res Function(StoreModel) then) =
      _$StoreModelCopyWithImpl<$Res, StoreModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
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
      @JsonKey(name: 'social_media_links')
      Map<String, dynamic>? socialMediaLinks,
      @JsonKey(name: 'website_url') String? websiteUrl,
      @JsonKey(name: 'store_banner_url') String? storeBannerUrl,
      @JsonKey(name: 'is_verified') bool? isVerified,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'featured_product_id') String? featuredProductId,
      @JsonKey(name: 'nid') String? nid,
      @JsonKey(name: 'tin') String? tin});
}

/// @nodoc
class _$StoreModelCopyWithImpl<$Res, $Val extends StoreModel>
    implements $StoreModelCopyWith<$Res> {
  _$StoreModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? storeName = freezed,
    Object? ownerId = freezed,
    Object? storeDescription = freezed,
    Object? storeLogoUrl = freezed,
    Object? contactNumber = freezed,
    Object? email = freezed,
    Object? addressLine1 = freezed,
    Object? addressLine2 = freezed,
    Object? postalCode = freezed,
    Object? storeType = freezed,
    Object? socialMediaLinks = freezed,
    Object? websiteUrl = freezed,
    Object? storeBannerUrl = freezed,
    Object? isVerified = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? featuredProductId = freezed,
    Object? nid = freezed,
    Object? tin = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      storeName: freezed == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      storeDescription: freezed == storeDescription
          ? _value.storeDescription
          : storeDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      storeLogoUrl: freezed == storeLogoUrl
          ? _value.storeLogoUrl
          : storeLogoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      contactNumber: freezed == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine1: freezed == addressLine1
          ? _value.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine2: freezed == addressLine2
          ? _value.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      storeType: freezed == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as String?,
      socialMediaLinks: freezed == socialMediaLinks
          ? _value.socialMediaLinks
          : socialMediaLinks // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      storeBannerUrl: freezed == storeBannerUrl
          ? _value.storeBannerUrl
          : storeBannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      featuredProductId: freezed == featuredProductId
          ? _value.featuredProductId
          : featuredProductId // ignore: cast_nullable_to_non_nullable
              as String?,
      nid: freezed == nid
          ? _value.nid
          : nid // ignore: cast_nullable_to_non_nullable
              as String?,
      tin: freezed == tin
          ? _value.tin
          : tin // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreModelImplCopyWith<$Res>
    implements $StoreModelCopyWith<$Res> {
  factory _$$StoreModelImplCopyWith(
          _$StoreModelImpl value, $Res Function(_$StoreModelImpl) then) =
      __$$StoreModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
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
      @JsonKey(name: 'social_media_links')
      Map<String, dynamic>? socialMediaLinks,
      @JsonKey(name: 'website_url') String? websiteUrl,
      @JsonKey(name: 'store_banner_url') String? storeBannerUrl,
      @JsonKey(name: 'is_verified') bool? isVerified,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      @JsonKey(name: 'featured_product_id') String? featuredProductId,
      @JsonKey(name: 'nid') String? nid,
      @JsonKey(name: 'tin') String? tin});
}

/// @nodoc
class __$$StoreModelImplCopyWithImpl<$Res>
    extends _$StoreModelCopyWithImpl<$Res, _$StoreModelImpl>
    implements _$$StoreModelImplCopyWith<$Res> {
  __$$StoreModelImplCopyWithImpl(
      _$StoreModelImpl _value, $Res Function(_$StoreModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? storeName = freezed,
    Object? ownerId = freezed,
    Object? storeDescription = freezed,
    Object? storeLogoUrl = freezed,
    Object? contactNumber = freezed,
    Object? email = freezed,
    Object? addressLine1 = freezed,
    Object? addressLine2 = freezed,
    Object? postalCode = freezed,
    Object? storeType = freezed,
    Object? socialMediaLinks = freezed,
    Object? websiteUrl = freezed,
    Object? storeBannerUrl = freezed,
    Object? isVerified = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? featuredProductId = freezed,
    Object? nid = freezed,
    Object? tin = freezed,
  }) {
    return _then(_$StoreModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      storeName: freezed == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      storeDescription: freezed == storeDescription
          ? _value.storeDescription
          : storeDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      storeLogoUrl: freezed == storeLogoUrl
          ? _value.storeLogoUrl
          : storeLogoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      contactNumber: freezed == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine1: freezed == addressLine1
          ? _value.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine2: freezed == addressLine2
          ? _value.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      storeType: freezed == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as String?,
      socialMediaLinks: freezed == socialMediaLinks
          ? _value._socialMediaLinks
          : socialMediaLinks // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      websiteUrl: freezed == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      storeBannerUrl: freezed == storeBannerUrl
          ? _value.storeBannerUrl
          : storeBannerUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      featuredProductId: freezed == featuredProductId
          ? _value.featuredProductId
          : featuredProductId // ignore: cast_nullable_to_non_nullable
              as String?,
      nid: freezed == nid
          ? _value.nid
          : nid // ignore: cast_nullable_to_non_nullable
              as String?,
      tin: freezed == tin
          ? _value.tin
          : tin // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreModelImpl implements _StoreModel {
  const _$StoreModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'store_name') this.storeName,
      @JsonKey(name: 'owner_id') this.ownerId,
      @JsonKey(name: 'store_description') this.storeDescription,
      @JsonKey(name: 'store_logo_url') this.storeLogoUrl,
      @JsonKey(name: 'contact_number') this.contactNumber,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'address_line1') this.addressLine1,
      @JsonKey(name: 'address_line2') this.addressLine2,
      @JsonKey(name: 'postal_code') this.postalCode,
      @JsonKey(name: 'store_type') this.storeType,
      @JsonKey(name: 'social_media_links')
      final Map<String, dynamic>? socialMediaLinks,
      @JsonKey(name: 'website_url') this.websiteUrl,
      @JsonKey(name: 'store_banner_url') this.storeBannerUrl,
      @JsonKey(name: 'is_verified') this.isVerified,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'featured_product_id') this.featuredProductId,
      @JsonKey(name: 'nid') this.nid,
      @JsonKey(name: 'tin') this.tin})
      : _socialMediaLinks = socialMediaLinks;

  factory _$StoreModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'store_name')
  final String? storeName;
  @override
  @JsonKey(name: 'owner_id')
  final String? ownerId;
  @override
  @JsonKey(name: 'store_description')
  final String? storeDescription;
  @override
  @JsonKey(name: 'store_logo_url')
  final String? storeLogoUrl;
  @override
  @JsonKey(name: 'contact_number')
  final String? contactNumber;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'address_line1')
  final String? addressLine1;
  @override
  @JsonKey(name: 'address_line2')
  final String? addressLine2;
  @override
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  @override
  @JsonKey(name: 'store_type')
  final String? storeType;
  final Map<String, dynamic>? _socialMediaLinks;
  @override
  @JsonKey(name: 'social_media_links')
  Map<String, dynamic>? get socialMediaLinks {
    final value = _socialMediaLinks;
    if (value == null) return null;
    if (_socialMediaLinks is EqualUnmodifiableMapView) return _socialMediaLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'website_url')
  final String? websiteUrl;
  @override
  @JsonKey(name: 'store_banner_url')
  final String? storeBannerUrl;
  @override
  @JsonKey(name: 'is_verified')
  final bool? isVerified;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'featured_product_id')
  final String? featuredProductId;
  @override
  @JsonKey(name: 'nid')
  final String? nid;
  @override
  @JsonKey(name: 'tin')
  final String? tin;

  @override
  String toString() {
    return 'StoreModel(id: $id, storeName: $storeName, ownerId: $ownerId, storeDescription: $storeDescription, storeLogoUrl: $storeLogoUrl, contactNumber: $contactNumber, email: $email, addressLine1: $addressLine1, addressLine2: $addressLine2, postalCode: $postalCode, storeType: $storeType, socialMediaLinks: $socialMediaLinks, websiteUrl: $websiteUrl, storeBannerUrl: $storeBannerUrl, isVerified: $isVerified, createdAt: $createdAt, updatedAt: $updatedAt, featuredProductId: $featuredProductId, nid: $nid, tin: $tin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.storeDescription, storeDescription) ||
                other.storeDescription == storeDescription) &&
            (identical(other.storeLogoUrl, storeLogoUrl) ||
                other.storeLogoUrl == storeLogoUrl) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.addressLine1, addressLine1) ||
                other.addressLine1 == addressLine1) &&
            (identical(other.addressLine2, addressLine2) ||
                other.addressLine2 == addressLine2) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.storeType, storeType) ||
                other.storeType == storeType) &&
            const DeepCollectionEquality()
                .equals(other._socialMediaLinks, _socialMediaLinks) &&
            (identical(other.websiteUrl, websiteUrl) ||
                other.websiteUrl == websiteUrl) &&
            (identical(other.storeBannerUrl, storeBannerUrl) ||
                other.storeBannerUrl == storeBannerUrl) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.featuredProductId, featuredProductId) ||
                other.featuredProductId == featuredProductId) &&
            (identical(other.nid, nid) || other.nid == nid) &&
            (identical(other.tin, tin) || other.tin == tin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        storeName,
        ownerId,
        storeDescription,
        storeLogoUrl,
        contactNumber,
        email,
        addressLine1,
        addressLine2,
        postalCode,
        storeType,
        const DeepCollectionEquality().hash(_socialMediaLinks),
        websiteUrl,
        storeBannerUrl,
        isVerified,
        createdAt,
        updatedAt,
        featuredProductId,
        nid,
        tin
      ]);

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreModelImplCopyWith<_$StoreModelImpl> get copyWith =>
      __$$StoreModelImplCopyWithImpl<_$StoreModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreModelImplToJson(
      this,
    );
  }
}

abstract class _StoreModel implements StoreModel {
  const factory _StoreModel(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'store_name') final String? storeName,
      @JsonKey(name: 'owner_id') final String? ownerId,
      @JsonKey(name: 'store_description') final String? storeDescription,
      @JsonKey(name: 'store_logo_url') final String? storeLogoUrl,
      @JsonKey(name: 'contact_number') final String? contactNumber,
      @JsonKey(name: 'email') final String? email,
      @JsonKey(name: 'address_line1') final String? addressLine1,
      @JsonKey(name: 'address_line2') final String? addressLine2,
      @JsonKey(name: 'postal_code') final String? postalCode,
      @JsonKey(name: 'store_type') final String? storeType,
      @JsonKey(name: 'social_media_links')
      final Map<String, dynamic>? socialMediaLinks,
      @JsonKey(name: 'website_url') final String? websiteUrl,
      @JsonKey(name: 'store_banner_url') final String? storeBannerUrl,
      @JsonKey(name: 'is_verified') final bool? isVerified,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      @JsonKey(name: 'featured_product_id') final String? featuredProductId,
      @JsonKey(name: 'nid') final String? nid,
      @JsonKey(name: 'tin') final String? tin}) = _$StoreModelImpl;

  factory _StoreModel.fromJson(Map<String, dynamic> json) =
      _$StoreModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'store_name')
  String? get storeName;
  @override
  @JsonKey(name: 'owner_id')
  String? get ownerId;
  @override
  @JsonKey(name: 'store_description')
  String? get storeDescription;
  @override
  @JsonKey(name: 'store_logo_url')
  String? get storeLogoUrl;
  @override
  @JsonKey(name: 'contact_number')
  String? get contactNumber;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'address_line1')
  String? get addressLine1;
  @override
  @JsonKey(name: 'address_line2')
  String? get addressLine2;
  @override
  @JsonKey(name: 'postal_code')
  String? get postalCode;
  @override
  @JsonKey(name: 'store_type')
  String? get storeType;
  @override
  @JsonKey(name: 'social_media_links')
  Map<String, dynamic>? get socialMediaLinks;
  @override
  @JsonKey(name: 'website_url')
  String? get websiteUrl;
  @override
  @JsonKey(name: 'store_banner_url')
  String? get storeBannerUrl;
  @override
  @JsonKey(name: 'is_verified')
  bool? get isVerified;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'featured_product_id')
  String? get featuredProductId;
  @override
  @JsonKey(name: 'nid')
  String? get nid;
  @override
  @JsonKey(name: 'tin')
  String? get tin;

  /// Create a copy of StoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreModelImplCopyWith<_$StoreModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
