import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/features/store/model/store_model.dart';
import 'package:deco_trade_hub/features/store/presentation/shared/widget/store_avatar_uploader.dart';
import 'package:deco_trade_hub/features/store/presentation/shared/widget/store_cover_uploader.dart';
import 'package:deco_trade_hub/features/store/presentation/wholesaler/view/store_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:shared/shared.dart';

import '../../../../../core/validators/form_validator.dart';
import '../../../../../services/dependencies/src/dependency_injection.dart';
import '../../shared/bloc/store_form/store_form_bloc.dart';

class StoreSignUpForm extends StatelessWidget {
  const StoreSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ServiceProvider.get<StoreFormBloc>(),
      child: const StoreSignUpFormView(),
    );
  }
}

class StoreSignUpFormView extends StatefulWidget {
  const StoreSignUpFormView({super.key});

  @override
  _StoreSignUpFormViewState createState() => _StoreSignUpFormViewState();
}

class _StoreSignUpFormViewState extends State<StoreSignUpFormView> {
  late final GlobalKey<FormState> _formKey;
  late final StoreFormBloc _bloc;
  String _storeType = 'Wholesaler';

  @override
  void initState() {
    _bloc = context.read<StoreFormBloc>();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget buildTitle(String title) {
      return Text(
        title,
        style: theme.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: theme.primaryColor,
        ),
      );
    }

    return BlocConsumer<StoreFormBloc, StoreFormState>(
      bloc: _bloc,
      listener: (context, StoreFormState state) {
        logI("Listener fired with status: ${state.status}");

        if (state.status == StoreFormStatus.success) {
          showCustomSnackBar(
              context: context, content: Text('Store sign-up successful!'));
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StorePage(store: dummyStore),
            ),
          );
        } else if (state.status == StoreFormStatus.error) {
          showCustomSnackBar(
            context: context,
            content: Text('Error: ${''}'),
          );
        }
      },
      builder: (context, StoreFormState state) {
        logI("Listener fired with status: ${state.status}");

        return Scaffold(
          // loading: (state.status == StoreFormStatus.submitting),
          appBar: AppBar(
            title: Text('Wholesaler Store Sign up'),
          ),
          // applySafeArea: true,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTitle('Store Name'),
                    const Gap(6),
                    AppTextField.roundedBorder(
                      hintText: 'Enter your store name',
                      onChanged: (value) => _bloc.add(StoreNameChanged(value)),
                      validator: (value) =>
                          Validator.notEmpty(value, 'store name'),
                    ),
                    const Gap(12),
                    buildTitle('Store Logo'),
                    const Gap(6),
                    StoreAvatarUploader(
                        onImageUploaded: (url) =>
                            _bloc.add(StoreLogoUrlChanged(url))),
                    const Gap(16),
                    buildTitle('Store Banner'),
                    const Gap(6),
                    StoreCoverUploader(
                        onImageUploaded: (url) =>
                            _bloc.add(StoreBannerUrlChanged(url))),
                    const Gap(16),
                    buildTitle('Owner Name'),
                    const Gap(6),
                    AppTextField.roundedBorder(
                      hintText: 'Enter your name',
                      onChanged: (value) => _bloc.add(OwnerNameChanged(value)),
                      validator: (value) => Validator.notEmpty(value, 'name'),
                    ),
                    const Gap(16),
                    buildTitle('Contact Number'),
                    const Gap(6),
                    AppTextField.roundedBorder(
                      hintText: 'Enter store contact number',
                      textInputType: TextInputType.phone,
                      onChanged: (value) => _bloc.add(ContactNumChanged(value)),
                      validator: (value) =>
                          Validator.validatePhoneNumber(value),
                    ),
                    const Gap(16),
                    buildTitle('Email'),
                    const Gap(6),
                    AppTextField.roundedBorder(
                      hintText: 'Enter your email',
                      onChanged: (value) => _bloc.add(EmailChanged(value)),
                      textInputType: TextInputType.emailAddress,
                      validator: (value) => Validator.validateEmail(value),
                    ),
                    const Gap(16),
                    buildTitle('Description'),
                    const Gap(6),
                    AppTextField.roundedBorder(
                      maxLines: 3,
                      hintText: 'Enter a brief description of your store',
                      onChanged: (value) => _bloc.add(StoreDescChanged(value)),
                    ),
                    const Gap(16),
                    buildTitle('Store Type'),
                    const Gap(6),
                    AppTextField.roundedBorder(
                      readOnly: true,
                      hintText: _storeType,
                      onChanged: (value) =>
                          _bloc.add(StoreTypeChanged(_storeType)),
                    ),
                    const Gap(16),
                    buildTitle('Address Line 1'),
                    const Gap(6),
                    AppTextField.roundedBorder(
                      hintText: 'Enter your address',
                      onChanged: (value) =>
                          _bloc.add(AddressLine1Changed(value)),
                      validator: (e) => Validator.notEmpty(e, 'address'),
                    ),
                    const Gap(16),
                    buildTitle('Address Line 2'),
                    const Gap(6),
                    AppTextField.roundedBorder(
                      hintText: 'Enter your address (optional)',
                      onChanged: (value) =>
                          _bloc.add(AddressLine2Changed(value)),
                    ),
                    const Gap(16),
                    buildTitle('Postal Code'),
                    const Gap(6),
                    AppTextField.roundedBorder(
                      hintText: 'Enter your postal code',
                      textInputType: TextInputType.number,
                      onChanged: (value) => _bloc.add(PostalCodeChanged(value)),
                      validator: (value) =>
                          Validator.notEmpty(value, 'postal code'),
                    ),
                    const Gap(16),
                    buildTitle('Social Media Links'),
                    const Gap(6),
                    AppTextField.roundedBorder(
                      hintText: 'Enter links (if any)',
                      onChanged: (value) => _bloc.add(StoreDescChanged(value)),
                      textInputType: TextInputType.url,
                    ),
                    const Gap(16),
                    buildTitle('TIN Card'),
                    const Gap(6),
                    AppTextField.roundedBorder(
                      hintText: 'Enter your TIN card number',
                      onChanged: (value) => _bloc.add(TinChanged(value)),
                      validator: (value) =>
                          Validator.notEmpty(value, 'TIN card number'),
                    ),
                    const Gap(16),
                    buildTitle('NID'),
                    const Gap(6),
                    AppTextField.roundedBorder(
                      hintText: 'Enter your NID number',
                      onChanged: (value) => _bloc.add(NidChanged(value)),
                      validator: (value) =>
                          Validator.notEmpty(value, 'NID number'),
                    ),
                    const Gap(24),
                    if (state.status == StoreFormStatus.submitting)
                      BaseLoaderWidget(),
                    SizedBox(
                      width: context.screenWidth,
                      child: FilledButton.tonal(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _bloc
                                .add(StoreFormSubmitted(storeType: _storeType));
                          }
                        },
                        child: buildTitle('Submit'),
                      ),
                    ),
                    const Gap(32),
                    FilledButton.tonal(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StorePage(
                              store: dummyStore,
                            ),
                          ),
                        );
                      },
                      child: buildTitle('Goto StoreDetails Page'),
                    ),
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

StoreModel dummyStore = StoreModel(
  id: '550e8400-e29b-41d4-a716-446655440000',
  storeName: 'Tech Haven',
  ownerId: '550e8400-e29b-41d4-a716-446655440001',
  storeDescription:
      'Your one-stop shop for cutting-edge technology and gadgets. We offer the latest in electronics, smart home devices, and computer accessories with expert advice and premium customer service.',
  storeLogoUrl: 'https://example.com/logo.png',
  contactNumber: '+1 (555) 123-4567',
  email: 'contact@techhaven.com',
  addressLine1: '123 Tech Valley',
  addressLine2: 'Suite 456',
  postalCode: 'TV 12345',
  storeType: 'Retailer',
  socialMediaLinks: {
    'facebook': 'https://facebook.com/techhaven',
    'instagram': 'https://instagram.com/techhaven',
    'twitter': 'https://twitter.com/techhaven'
  },
  websiteUrl: 'https://techhaven.com',
  storeBannerUrl: 'https://example.com/banner.jpg',
  isVerified: true,
  createdAt: DateTime.now().subtract(const Duration(days: 365)),
  updatedAt: DateTime.now(),
  featuredProductId: '550e8400-e29b-41d4-a716-446655440002',
  nid: '1234567890123',
  tin: 'TIN-987654321',
);
