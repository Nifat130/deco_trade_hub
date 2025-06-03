import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/app/router/app_routes.dart';
import 'package:deco_trade_hub/core/utils/constants/app_sizer.dart';
import 'package:deco_trade_hub/features/Authentication/data/data_source/auth_datasource_impl.dart';
import 'package:deco_trade_hub/features/Authentication/data/repository/auth_repo_impl.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/shared/bloc/auth_cubit.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/signin/bloc/signin_bloc.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/signup/view/signup_view.dart';
import 'package:deco_trade_hub/ui/nifat/widgets/custom_button.dart';
import 'package:deco_trade_hub/ui/widgets/global/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/constants/app_colors.dart';
import '../../../../../ui/nifat/widgets/custom_text.dart';
import '../../shared/widget/custom_textfield_with_onchanged.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepoImpl(authDataSource: AuthDataSourceImpl()),
      child: BlocProvider(
        create: (context) => SignInBloc(
          authRepo: context.read<AuthRepoImpl>(),
          authCubit: context.read<AuthCubit>(),
        ),
        child: const SignInView(),
      ),
    );
  }
}

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Sign In', isBackButtonExist: true),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Sign in with your email and password\nor continue with social media',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF757575),
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: const SignInForm(),
              ),

              const SizedBox(height: 24),

              // Social Logins
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: SvgPicture.string(googleIcon),
                    press: () {},
                  ),
                  const SizedBox(width: 16),
                  SocialCard(
                    icon: SvgPicture.string(facebookIcon),
                    press: () {},
                  ),
                  const SizedBox(width: 16),
                  SocialCard(
                    icon: SvgPicture.string(twitterIcon),
                    press: () {},
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const NoAccountText(),
              const Spacer(),

              // Terms at the bottom
              CustomText(
                text: "By joining you agree to our Terms of Service and Privacy Policy",
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: AppColors.textSecondary,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFieldWithOnChanged(
            onChanged: (email) => context.read<SignInBloc>().add(EmailChanged(email: email)),
            textInputAction: TextInputAction.next,
            prefixIcon: const Icon(Icons.email_outlined),
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
            validator: (email) {
              if (email == null || email.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),
          CustomTextFieldWithOnChanged(
            obscureText: true,
            prefixIcon: const Icon(Icons.lock_outline),
            onChanged: (password) => context.read<SignInBloc>().add(PasswordChanged(password: password)),
            hintText: 'Enter your password',
            validator: (password) {
              if (password == null || password.isEmpty) {
                return 'Please enter your password';
              }
              if (password.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
          SizedBox(height: 24.h),
          BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state.status == SignInStatus.success) {
                Get.toNamed(AppRoutes.rolePrompt);
              }
              if (state.status == SignInStatus.failure) {
                context.showCustomSnackBar(text: state.errorMessage);
              }
            },
            builder: (context, SignInState state) {
              return CustomButton(
                loading: state.status == SignInStatus.submitting,
                onPressed: () => context.read<SignInBloc>().add(const LoginSubmitted()),
                title: 'Continue',
              );
            },
          ),
        ],
      ),
    );
  }
}

class NoAccountText extends StatelessWidget {
  const NoAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don’t have an account? ',
          style: TextStyle(color: Color(0xFF757575)),
        ),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.signUp);
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              color: Color(0xFFFF7643),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
