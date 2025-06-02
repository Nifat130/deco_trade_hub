import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/app/router/app_routes.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/controllers/auth_controller.dart';
import 'package:deco_trade_hub/features/Authentication/presentation/shared/widget/custom_textfield_with_onchanged.dart';
import 'package:deco_trade_hub/features/store/presentation/shared/widget/store_avatar_uploader.dart';
import 'package:deco_trade_hub/features/store/presentation/shared/widget/store_cover_uploader.dart';
import 'package:deco_trade_hub/features/store/repository/store_repository.dart';
import 'package:deco_trade_hub/ui/nifat/widgets/custom_button.dart';
import 'package:deco_trade_hub/ui/nifat/widgets/custom_text.dart';
import 'package:deco_trade_hub/ui/widgets/global/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../../core/validators/form_validator.dart';
import '../../shared/bloc/store_form/store_form_bloc.dart';

class StoreSignUpForm extends StatelessWidget {
  final String storeType;

  const StoreSignUpForm({super.key, required this.storeType});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StoreFormBloc(Get.find<StoreRepository>()),
      child: StoreSignUpFormView(storeType: storeType),
    );
  }
}

class StoreSignUpFormView extends StatefulWidget {
  final String storeType;

  const StoreSignUpFormView({super.key, required this.storeType});

  @override
  _StoreSignUpFormViewState createState() => _StoreSignUpFormViewState();
}

class _StoreSignUpFormViewState extends State<StoreSignUpFormView> {
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _storeType = widget.storeType;

    return BlocConsumer<StoreFormBloc, StoreFormState>(
      listener: (context, StoreFormState state) {
        if (state.status == StoreFormStatus.success) {
          if (_storeType == UserRole.isRetailer.value) {
            Get.offAllNamed(AppRoutes.retailerHome);
          }
          if (_storeType == UserRole.isWholesaler.value) {
            Get.offAllNamed(AppRoutes.wholesalerHome);
          }
        }

        if (state.status == StoreFormStatus.error) {
          context.showErrorSnackBar(text: '${state.errorMessage}');
        }
      },
      builder: (context, StoreFormState state) {
        // if (state.status == StoreFormStatus.submitting) {
        //   return const BaseLoaderWidget();
        // }

        return AppScaffold(
          appBar: CustomAppBar(title: '${_storeType.capitalizeFirst} Sign Up'),
          // applySafeArea: true,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'Store Name'),
                    const Gap(6),
                    CustomTextFieldWithOnChanged(
                      disabled: state.status == StoreFormStatus.submitting,
                      hintText: 'Enter your store name',
                      onChanged: (value) => context.read<StoreFormBloc>().add(StoreNameChanged(value)),
                      validator: (value) => Validator.notEmpty(value, 'store name'),
                    ),
                    const Gap(12),
                    CustomText(text: 'Store Logo'),
                    const Gap(6),
                    StoreAvatarUploader(
                        onImageUploaded: (url) => context.read<StoreFormBloc>().add(StoreLogoUrlChanged(url))),
                    const Gap(16),
                    CustomText(text: 'Store Banner'),
                    const Gap(6),
                    StoreCoverUploader(
                        onImageUploaded: (url) => context.read<StoreFormBloc>().add(StoreBannerUrlChanged(url))),
                    const Gap(16),
                    CustomText(text: 'Owner Name'),
                    const Gap(6),
                    CustomTextFieldWithOnChanged(
                      disabled: state.status == StoreFormStatus.submitting,
                      hintText: 'Enter your name',
                      onChanged: (value) => context.read<StoreFormBloc>().add(OwnerNameChanged(value)),
                      validator: (value) => Validator.notEmpty(value, 'name'),
                    ),
                    const Gap(16),
                    CustomText(text: 'Contact Number'),
                    const Gap(6),
                    CustomTextFieldWithOnChanged(
                      disabled: state.status == StoreFormStatus.submitting,
                      hintText: 'Enter store contact number',
                      keyboardType: TextInputType.phone,
                      onChanged: (value) => context.read<StoreFormBloc>().add(ContactNumChanged(value)),
                      validator: (value) => Validator.validatePhoneNumber(value),
                    ),
                    const Gap(16),
                    CustomText(text: 'Email'),
                    const Gap(6),
                    CustomTextFieldWithOnChanged(
                      disabled: state.status == StoreFormStatus.submitting,
                      hintText: 'Enter your email',
                      onChanged: (value) => context.read<StoreFormBloc>().add(EmailChanged(value)),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => Validator.validateEmail(value),
                    ),
                    const Gap(16),
                    CustomText(text: 'Description'),
                    const Gap(6),
                    CustomTextFieldWithOnChanged(
                      disabled: state.status == StoreFormStatus.submitting,
                      maxLine: 3,
                      hintText: 'Enter a brief description of your store',
                      onChanged: (value) => context.read<StoreFormBloc>().add(StoreDescChanged(value)),
                    ),
                    const Gap(16),
                    CustomText(text: 'Store Type'),
                    const Gap(6),
                    CustomTextFieldWithOnChanged(
                      disabled: state.status == StoreFormStatus.submitting,
                      readOnly: true,
                      hintText: _storeType,
                      onChanged: (value) => context.read<StoreFormBloc>().add(StoreTypeChanged(_storeType)),
                    ),
                    const Gap(16),
                    CustomText(text: 'Address Line 1'),
                    const Gap(6),
                    CustomTextFieldWithOnChanged(
                      disabled: state.status == StoreFormStatus.submitting,
                      hintText: 'Enter your address',
                      onChanged: (value) => context.read<StoreFormBloc>().add(AddressLine1Changed(value)),
                      validator: (e) => Validator.notEmpty(e, 'address'),
                    ),
                    const Gap(16),
                    CustomText(text: 'Address Line 2'),
                    const Gap(6),
                    CustomTextFieldWithOnChanged(
                      disabled: state.status == StoreFormStatus.submitting,
                      hintText: 'Enter your address (optional)',
                      onChanged: (value) => context.read<StoreFormBloc>().add(AddressLine2Changed(value)),
                    ),
                    const Gap(16),
                    CustomText(text: 'Postal Code'),
                    const Gap(6),
                    CustomTextFieldWithOnChanged(
                      disabled: state.status == StoreFormStatus.submitting,
                      hintText: 'Enter your postal code',
                      keyboardType: TextInputType.number,
                      onChanged: (value) => context.read<StoreFormBloc>().add(PostalCodeChanged(value)),
                      validator: (value) => Validator.notEmpty(value, 'postal code'),
                    ),
                    const Gap(16),
                    CustomText(text: 'Social Media Links'),
                    const Gap(6),
                    CustomTextFieldWithOnChanged(
                      disabled: state.status == StoreFormStatus.submitting,
                      hintText: 'Enter links (if any)',
                      onChanged: (value) => context.read<StoreFormBloc>().add(StoreDescChanged(value)),
                      keyboardType: TextInputType.url,
                    ),
                    const Gap(16),
                    CustomText(text: 'TIN Card'),
                    const Gap(6),
                    CustomTextFieldWithOnChanged(
                      disabled: state.status == StoreFormStatus.submitting,
                      hintText: 'Enter your TIN card number',
                      onChanged: (value) => context.read<StoreFormBloc>().add(TinChanged(value)),
                      validator: (value) => Validator.notEmpty(value, 'TIN card number'),
                    ),
                    const Gap(16),
                    CustomText(text: 'NID'),
                    const Gap(6),
                    CustomTextFieldWithOnChanged(
                      disabled: state.status == StoreFormStatus.submitting,
                      hintText: 'Enter your NID number',
                      onChanged: (value) => context.read<StoreFormBloc>().add(NidChanged(value)),
                      validator: (value) => Validator.notEmpty(value, 'NID number'),
                    ),
                    const Gap(24),
                    SizedBox(
                      width: context.screenWidth,
                      child: CustomButton(
                        loading: state.status == StoreFormStatus.submitting,
                        onPressed: () {
                          // if (_formKey.currentState!.validate()) {
                          context.read<StoreFormBloc>().add(StoreFormSubmitted(storeType: _storeType));
                          // }
                        },
                        title: 'Submit',
                      ),
                    ),
                    const Gap(32),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
