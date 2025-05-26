import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/app/router/app_routes.dart';
import 'package:deco_trade_hub/features/Authentication/data/data_source/auth_datasource_impl.dart';
import 'package:deco_trade_hub/features/Authentication/data/repository/auth_repo_impl.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/shared/bloc/auth_cubit.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/signin/bloc/signin_bloc.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/signup/view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
        child: const SignInView2(),
      ),
    );
  }
}

class SignInView2 extends StatelessWidget {
  const SignInView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Sign In'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sign in with your email and password '
                    ' \nor continue with social media',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF757575)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  const SignInForm(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialCard(
                        icon: SvgPicture.string(googleIcon),
                        press: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SocialCard(
                          icon: SvgPicture.string(facebookIcon),
                          press: () {},
                        ),
                      ),
                      SocialCard(
                        icon: SvgPicture.string(twitterIcon),
                        press: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    super.key,
  });

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
            ),
          ),
        ),
      ],
    );
  }
}

const authOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(color: Color(0xFF757575)),
  borderRadius: BorderRadius.all(Radius.circular(100)),
);

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            onSaved: (email) {},
            onChanged: (email) => context.read<SignInBloc>().add(EmailChanged(email: email)),
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: 'Enter your email',
              labelText: 'Email',
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintStyle: const TextStyle(color: Color(0xFF757575)),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              suffix: SvgPicture.string(
                mailIcon,
              ),
              border: authOutlineInputBorder,
              enabledBorder: authOutlineInputBorder,
              focusedBorder: authOutlineInputBorder.copyWith(
                borderSide: const BorderSide(
                  color: Color(0xFFFF7643),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: TextFormField(
              onSaved: (password) {},
              onChanged: (password) => context.read<SignInBloc>().add(PasswordChanged(password: password)),
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                labelText: 'Password',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintStyle: const TextStyle(color: Color(0xFF757575)),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                suffix: SvgPicture.string(
                  lockIcon,
                ),
                border: authOutlineInputBorder,
                enabledBorder: authOutlineInputBorder,
                focusedBorder: authOutlineInputBorder.copyWith(
                  borderSide: const BorderSide(color: Color(0xFFFF7643)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          BlocListener<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state.status == SignInStatus.submitting) {}
              if (state.status == SignInStatus.success) {
                Get.toNamed(AppRoutes.rolePrompt);
              }
              if (state.status == SignInStatus.failure) {
                context.showCustomSnackBar(text: state.errorMessage);
              }
            },
            child: ElevatedButton(
              onPressed: () => context.read<SignInBloc>().add(const LoginSubmitted()),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xFFFF7643),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}
