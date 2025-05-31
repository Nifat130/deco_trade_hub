enum StorageKeys {
  isFirstTimer('is_first_timer'),
  accessToken('access_token'),
  refreshToken('refresh_token');

  const StorageKeys(this.keyString);

  final String keyString;
}

// enum UserRole {
//   isRetailer('Retailer'),
//   isWholesaler('Wholesaler');
//
//   const UserRole(this.value);
//
//   final String value;
// }
