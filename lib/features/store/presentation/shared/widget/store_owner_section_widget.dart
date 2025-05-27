import 'package:app_ui/app_ui.dart';
import 'package:deco_trade_hub/features/store/presentation/controllers/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class StoreOwnerSection extends StatelessWidget {
  const StoreOwnerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StoreController>(
      builder: (controller) {
        if (controller.isLoadingOwner) {
          return const Center(child: CircularProgressIndicator());
        }

        final owner = controller.storeOwner;
        if (owner == null) {
          return const Text("No owner info found.");
        }

        return Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: owner.avatarUrl != null ? CachedNetworkImageProvider(owner.avatarUrl!) : null,
              backgroundColor: Colors.grey.shade300,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  owner.fullName,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(owner.username, style: const TextStyle(color: Colors.grey)),
                if (owner.phoneNumber?.isNotEmpty == true)
                  Text(owner.phoneNumber!, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        );
      },
    );
  }
}
