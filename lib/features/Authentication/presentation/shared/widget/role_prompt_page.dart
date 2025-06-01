import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/app/router/app_routes.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/controllers/auth_controller.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/shared/bloc/auth_cubit.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/shared/widget/role_container.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/signin/view/signin_view.dart';
import 'package:deco_trade_hub/features/home/presentation/retailer/navigation/retailer_bottom_navbar.dart';
import 'package:deco_trade_hub/features/home/presentation/wholesaler/navigation/wholesaler_bottom_navbar.dart';
import 'package:deco_trade_hub/ui/nifat/widgets/custom_button.dart';
import 'package:deco_trade_hub/ui/nifat/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constants/icon_path.dart';

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
        if (state is AuthenticatedWithStore) {
          context.showSuccessSnackBar(text: 'Welcome back ${state.user.email}');
        } else if (state is AuthenticatedWithoutStore) {
          Get.toNamed(AppRoutes.storeForm, arguments: {'storeType': state.user.userMetadata?['role']});
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
          AuthenticatedWithStore() => (state.user.userMetadata != null && state.user.userMetadata!['role'] != null)
              ? (state.user.userMetadata!['role'] == UserRole.isRetailer.value)
                  ? const RetailerRoute()
                  : const WholesalerRoute()
              : const SignInPage(),
          UnAuthenticated() => SignUpWithRoleScreen(),
          AuthenticatedWithoutStore() => BaseScreenWidget(
              loading: true,
              body: Center(
                child: SvgPicture.asset(
                  'assets/svg/splash_deco_trade_hub.svg',
                  width: 600,
                  height: 600,
                ),
              ),
            ),
        };
      },
    );
  }
}

class SignUpWithRoleScreen extends StatelessWidget {
  const SignUpWithRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade50,
              Colors.white,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: GetBuilder<AuthController>(
            builder: (controller) {
              return Column(
                children: [
                  const SizedBox(height: 60),
                  Hero(
                    tag: 'app_logo',
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 150,
                      width: 150,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const CustomText(
                    text: 'Create an Account',
                    fontSize: 24,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Choose your role to get started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                  Row(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoleContainer(
                        roleName: UserRole.isWholesaler,
                        iconPath: controller.currentRole.value == "Wholesaler"
                            ? IconPath.importerIcon
                            : IconPath.importerBWIcon,
                      ),
                      RoleContainer(
                        roleName: UserRole.isRetailer,
                        iconPath: controller.currentRole.value == "Retailer"
                            ? IconPath.retailerIcon
                            : IconPath.retailerBWIcon,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  CustomButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.signUp, arguments: {
                        controller.currentRole.value,
                      });
                    },
                    title: 'Sign Up as ${controller.currentRole.value}',
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.signIn);
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueGrey,
                        ),
                        children: [
                          TextSpan(
                            text: 'Log In',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
