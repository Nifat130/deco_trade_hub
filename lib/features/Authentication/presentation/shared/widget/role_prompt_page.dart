import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/app/router/app_routes.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/shared/bloc/auth_cubit.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/signin/view/signin_view.dart';
import 'package:deco_trade_hub/features/home/presentation/retailer/navigation/retailer_bottom_navbar.dart';
import 'package:deco_trade_hub/features/home/presentation/wholesaler/navigation/wholesaler_bottom_navbar.dart';
import 'package:deco_trade_hub/services/global/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RolePromptPage extends StatefulWidget {
  const RolePromptPage({super.key});

  static const routeName = '/role_prompt_page';

  @override
  State<RolePromptPage> createState() => _RolePromptPageState();
}

class _RolePromptPageState extends State<RolePromptPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const RolePromptView();
  }
}

class RolePromptView extends StatelessWidget {
  const RolePromptView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          context.showErrorSnackBar(text: state.message);
        }
      },
      builder: (context, state) {
        return switch (state) {
          AuthInitial() => const CircularProgressIndicator(),
          AuthLoading() => BaseScreenWidget(
              loading: true,
              body: Center(
                child: SvgPicture.asset(
                  'assets/svg/splash_deco_trade_hub.svg',
                  width: 300,
                  height: 300,
                ),
              ),
            ),
          Authenticated() => (state.user.userMetadata != null && state.user.userMetadata!['role'] != null)
              ? (state.user.userMetadata!['role'] == UserRole.isRetailer.value)
                  ? const RetailerRoute()
                  : const WholesalerRoute()
              : const SignInPage(),
          UnAuthenticated() => Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: const Text(
                  'Create an Account',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Choose your role to get started',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),

                    // Retailer Button
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(
                          AppRoutes.signUp,
                          arguments: UserRole.isRetailer.value,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 60),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'Sign Up as Retailer',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Wholesaler Button
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed(
                          AppRoutes.signUp,
                          arguments: UserRole.isWholesaler.value,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 60),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'Sign Up as Wholesaler',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Already Have an Account? Login Text Button
                    TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.signIn);
                      },
                      child: const Text(
                        'Already have an account? Log In',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        };
      },
    );
  }
}
