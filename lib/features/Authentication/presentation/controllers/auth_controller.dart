import 'package:get/get.dart';

enum AuthPages {
  login,
  register,
}

enum UserRole {
  isRetailer('Retailer'),
  isWholesaler('Wholesaler');

  const UserRole(this.value);

  final String value;
}

class AuthController extends GetxController implements GetxService {
  AuthController();

  AuthPages _currentPage = AuthPages.login;
  UserRole _currentRole = UserRole.isRetailer;

  void setCurrentPage(AuthPages page) {
    _currentPage = page;
    update();
  }

  void setCurrentRole(UserRole role) {
    _currentRole = role;
    update();
  }

  AuthPages get currentPage => _currentPage;

  UserRole get currentRole => _currentRole;
}
