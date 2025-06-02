part of 'store_form_bloc.dart';

sealed class StoreFormEvent {
  const StoreFormEvent();
}

class StoreFormSubmitted extends StoreFormEvent {
  final String storeType;
  const StoreFormSubmitted({required this.storeType});
}

class StoreFormReset extends StoreFormEvent {
  const StoreFormReset();
}

class StoreNameChanged extends StoreFormEvent {
  final String storeName;

  const StoreNameChanged(this.storeName);
}

class OwnerNameChanged extends StoreFormEvent {
  final String ownerName;

  const OwnerNameChanged(this.ownerName);
}

class ContactNumChanged extends StoreFormEvent {
  final String contactNumber;

  const ContactNumChanged(this.contactNumber);
}

class EmailChanged extends StoreFormEvent {
  final String email;

  const EmailChanged(this.email);
}

class AddressLine1Changed extends StoreFormEvent {
  final String addressLine1;

  const AddressLine1Changed(this.addressLine1);
}

class AddressLine2Changed extends StoreFormEvent {
  final String addressLine2;

  const AddressLine2Changed(this.addressLine2);
}

class PostalCodeChanged extends StoreFormEvent {
  final String postalCode;

  const PostalCodeChanged(this.postalCode);
}

class StoreTypeChanged extends StoreFormEvent {
  final String storeType;

  const StoreTypeChanged(this.storeType);
}

class StoreDescChanged extends StoreFormEvent {
  final String storeDescription;

  const StoreDescChanged(this.storeDescription);
}

class StoreLogoUrlChanged extends StoreFormEvent {
  final String storeLogoUrl;

  const StoreLogoUrlChanged(this.storeLogoUrl);
}

class StoreBannerUrlChanged extends StoreFormEvent {
  final String storeBannerUrl;

  const StoreBannerUrlChanged(this.storeBannerUrl);
}

class SocialMediaLinksChanged extends StoreFormEvent {
  final Map<String, dynamic> socialMediaLinks;

  const SocialMediaLinksChanged(this.socialMediaLinks);
}

class WebsiteUrlChanged extends StoreFormEvent {
  final String websiteUrl;

  const WebsiteUrlChanged(this.websiteUrl);
}

class IsVerifiedChanged extends StoreFormEvent {
  final bool isVerified;

  const IsVerifiedChanged(this.isVerified);
}

class FeaturedProductIdChanged extends StoreFormEvent {
  final String featuredProductId;

  const FeaturedProductIdChanged(this.featuredProductId);
}

class NidChanged extends StoreFormEvent {
  final String nid;

  const NidChanged(this.nid);
}

class TinChanged extends StoreFormEvent {
  final String tin;

  const TinChanged(this.tin);
}
