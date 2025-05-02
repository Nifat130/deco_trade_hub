part of 'store_form_bloc.dart';

enum StoreFormStatus { initial, submitting, success, error }

class StoreFormState extends Equatable {
  final String storeName;
  final String ownerName;
  final String contactNumber;
  final String email;
  final String addressLine1;
  final String postalCode;
  final String storeType;
  final String? storeDescription;
  final String? storeLogoUrl;
  final String? storeBannerUrl;
  final String? addressLine2;
  final Map<String, dynamic>? socialMediaLinks;
  final String? websiteUrl;
  final bool isVerified;
  final String? featuredProductId;
  final String? ownerNID;
  final String? ownerTIN;
  final StoreFormStatus status;

  const StoreFormState.StoreFormState({
    required this.storeName,
    required this.ownerName,
    required this.contactNumber,
    required this.email,
    required this.addressLine1,
    required this.postalCode,
    required this.storeType,
    required this.status,
    this.storeDescription,
    this.storeLogoUrl,
    this.addressLine2,
    this.socialMediaLinks,
    this.websiteUrl,
    this.storeBannerUrl,
    this.ownerNID,
    this.ownerTIN,
    this.isVerified = false,
    this.featuredProductId,
  });

  StoreFormState.initial()
      : storeName = '',
        ownerName = '',
        contactNumber = '',
        email = '',
        addressLine1 = '',
        postalCode = '',
        storeType = '',
        status = StoreFormStatus.initial,
        storeDescription = '',
        storeLogoUrl = '',
        storeBannerUrl = '',
        addressLine2 = '',
        socialMediaLinks = {},
        websiteUrl = '',
        ownerNID = '',
        ownerTIN = '',
        isVerified = false,
        featuredProductId = '';

  StoreFormState copyWith({
    String? storeName,
    String? ownerName,
    String? contactNumber,
    String? email,
    String? addressLine1,
    String? postalCode,
    String? storeType,
    String? storeDescription,
    String? addressLine2,
    Map<String, dynamic>? socialMediaLinks,
    String? websiteUrl,
    String? storeLogoUrl,
    String? storeBannerUrl,
    bool? isVerified,
    String? featuredProductId,
    String? ownerNID,
    String? ownerTIN,
    StoreFormStatus? status,
  }) {
    return StoreFormState.StoreFormState(
      status: status ?? this.status,
      storeName: storeName ?? this.storeName,
      ownerName: ownerName ?? this.ownerName,
      contactNumber: contactNumber ?? this.contactNumber,
      email: email ?? this.email,
      addressLine1: addressLine1 ?? this.addressLine1,
      postalCode: postalCode ?? this.postalCode,
      storeType: storeType ?? this.storeType,
      storeDescription: storeDescription ?? this.storeDescription,
      storeLogoUrl: storeLogoUrl ?? this.storeLogoUrl,
      storeBannerUrl: storeBannerUrl ?? this.storeBannerUrl,
      addressLine2: addressLine2 ?? this.addressLine2,
      socialMediaLinks: socialMediaLinks ?? this.socialMediaLinks,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      ownerNID: ownerNID ?? this.ownerNID,
      ownerTIN: ownerTIN ?? this.ownerTIN,
      isVerified: isVerified ?? this.isVerified,
      featuredProductId: featuredProductId ?? this.featuredProductId,
    );
  }

  @override
  List<Object?> get props => [
        storeName,
        ownerName,
        contactNumber,
        email,
        addressLine1,
        postalCode,
        storeType,
        storeDescription,
        storeLogoUrl,
        addressLine2,
        socialMediaLinks,
        websiteUrl,
        storeBannerUrl,
        ownerNID,
        ownerTIN,
        isVerified,
        featuredProductId,
      ];
}
