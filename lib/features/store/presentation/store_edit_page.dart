import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/features/store/model/store_model.dart';
import 'package:deco_trade_hub/ui/widgets/global/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/store_controller.dart';

class EditStorePage extends StatefulWidget {
  final StoreModel store;

  const EditStorePage({super.key, required this.store});

  @override
  State<EditStorePage> createState() => _EditStorePageState();
}

class _EditStorePageState extends State<EditStorePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nameCtrl;
  late final TextEditingController descCtrl;
  late final TextEditingController contactCtrl;
  late final TextEditingController emailCtrl;
  late final TextEditingController addr1Ctrl;
  late final TextEditingController addr2Ctrl;
  late final TextEditingController websiteCtrl;

  @override
  void initState() {
    super.initState();
    final store = widget.store;
    nameCtrl = TextEditingController(text: store.storeName);
    descCtrl = TextEditingController(text: store.storeDescription ?? '');
    contactCtrl = TextEditingController(text: store.contactNumber ?? '');
    emailCtrl = TextEditingController(text: store.email ?? '');
    addr1Ctrl = TextEditingController(text: store.addressLine1 ?? '');
    addr2Ctrl = TextEditingController(text: store.addressLine2 ?? '');
    websiteCtrl = TextEditingController(text: store.websiteUrl ?? '');
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      final controller = Get.find<StoreController>();
      await controller.updateStoreDetails(
        storeId: widget.store.id!,
        storeName: nameCtrl.text,
        contactNumber: contactCtrl.text,
        email: emailCtrl.text,
        addressLine1: addr1Ctrl.text,
        addressLine2: addr2Ctrl.text,
        websiteUrl: websiteCtrl.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      releaseFocus: true,
      appBar: const CustomAppBar(title: 'Edit Store'),
      body: GetBuilder<StoreController>(builder: (controller) {
        return IgnorePointer(
          ignoring: controller.isLoadingStore,
          child: Opacity(
            opacity: controller.isLoadingStore ? 0.6 : 1.0,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 20),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextField.roundedBorder(
                          controller: nameCtrl,
                          labelText: 'Store Name',
                          validator: (v) => v!.trim().isEmpty ? 'Store name is required' : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: descCtrl,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          maxLines: 5,
                        ),
                        const SizedBox(height: 16),
                        AppTextField.roundedBorder(controller: contactCtrl, labelText: 'Contact Number'),
                        const SizedBox(height: 16),
                        AppTextField.roundedBorder(controller: emailCtrl, labelText: 'Email'),
                        const SizedBox(height: 16),
                        AppTextField.roundedBorder(controller: addr1Ctrl, labelText: 'Address Line 1'),
                        const SizedBox(height: 16),
                        AppTextField.roundedBorder(controller: addr2Ctrl, labelText: 'Address Line 2'),
                        const SizedBox(height: 16),
                        AppTextField.roundedBorder(controller: websiteCtrl, labelText: 'Website URL'),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: controller.isLoadingStore ? null : _submit,
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              backgroundColor: Theme.of(context).colorScheme.primary,
                            ),
                            child: controller.isLoadingStore
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.save, color: Colors.white),
                                      SizedBox(width: 8),
                                      Text(
                                        'Save Changes',
                                        style:
                                            TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
