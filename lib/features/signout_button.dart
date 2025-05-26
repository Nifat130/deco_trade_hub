import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../app/router/app_routes.dart';
import 'Authentication/presentation/shared/bloc/auth_cubit.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Get.offAllNamed(AppRoutes.signIn);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const CircularProgressIndicator();
        }
        return FilledButton.icon(
          label: const Text('Log Out'),
          onPressed: () {
            context.read<AuthCubit>().signOut();
          },
          icon: const Icon(Icons.logout),
        );
      },
    );
  }
}
