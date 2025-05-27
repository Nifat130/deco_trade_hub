import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class StoreProfileHeader extends StatelessWidget {
  final String profileUrl;
  final String coverUrl;
  final String storeName;
  final String storeOwner;
  final VoidCallback? onEdit;

  const StoreProfileHeader({
    super.key,
    required this.profileUrl,
    required this.coverUrl,
    required this.storeName,
    required this.storeOwner,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    profileUrl, // Example cover photo
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Positioned(
              left: 16,
              bottom: -32,
              child: CircleAvatar(
                radius: 48,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 44,
                  backgroundImage: CachedNetworkImageProvider(
                    coverUrl, // Example profile photo
                  ),
                ),
              ),
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: ElevatedButton.icon(
                onPressed: onEdit,
                icon: const Icon(Icons.edit),
                label: const Text('Edit Store'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withValues(alpha: .8),
                  foregroundColor: Colors.black87,
                ),
              ),
            ),
          ],
          clipBehavior: Clip.none,
        ),
        const SizedBox(height: 40),
        // Store Name and Info
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                storeName,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                storeOwner,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
