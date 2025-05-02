import 'package:deco_trade_hub/features/store/model/store_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StorePage extends StatelessWidget {
  final StoreModel store;

  const StorePage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _StoreHeader(store: store),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStoreInfoSection(theme, colors),
                    const SizedBox(height: 24),
                    _buildContactSection(colors),
                    const SizedBox(height: 24),
                    if (store.socialMediaLinks?.isNotEmpty ?? false)
                      _buildSocialMediaSection(colors),
                    const SizedBox(height: 24),
                    _buildLegalInfoSection(theme),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreInfoSection(ThemeData theme, ColorScheme colors) {
    return InfoCard(
      title: 'About Us',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            store.storeDescription ?? 'No description available',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: colors.onSurface.withValues(alpha: .8),
            ),
          ),
          const SizedBox(height: 16),
          _InfoItem(
            icon: Icons.store_mall_directory,
            title: 'Store Type',
            value: store.storeType ?? 'N/A',
          ),
          _InfoItem(
            icon: Icons.calendar_today,
            title: 'Member Since',
            value: store.createdAt?.year.toString() ?? 'N/A',
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(ColorScheme colors) {
    return InfoCard(
      title: 'Contact Information',
      child: Column(
        children: [
          _InfoItem(
            icon: Icons.phone,
            title: 'Contact Number',
            value: store.contactNumber ?? 'N/A',
          ),
          _InfoItem(
            icon: Icons.email,
            title: 'Email Address',
            value: store.email ?? 'N/A',
          ),
          _InfoItem(
            icon: Icons.location_on,
            title: 'Address',
            value: _buildAddressText(),
          ),
        ],
      ),
    );
  }

  String _buildAddressText() {
    return [
      store.addressLine1,
      store.addressLine2,
      store.postalCode,
    ].where((part) => part?.isNotEmpty ?? false).join(', ');
  }

  Widget _buildSocialMediaSection(ColorScheme colors) {
    return InfoCard(
      title: 'Follow Us',
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: store.socialMediaLinks!.entries.map((entry) {
          return SocialMediaButton(
            platform: entry.key,
            url: entry.value,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildLegalInfoSection(ThemeData theme) {
    return InfoCard(
      title: 'Legal Information',
      child: Column(
        children: [
          _InfoItem(
            icon: Icons.assignment,
            title: 'NID Number',
            value: store.nid ?? 'Not provided',
          ),
          _InfoItem(
            icon: Icons.receipt,
            title: 'TIN Number',
            value: store.tin ?? 'Not provided',
          ),
        ],
      ),
    );
  }
}

class _StoreHeader extends StatelessWidget {
  final StoreModel store;

  const _StoreHeader({required this.store});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            _buildStoreBanner(),
            _buildStoreLogo(),
          ],
        ),
      ),
      pinned: true,
    );
  }

  Widget _buildStoreBanner() {
    return store.storeBannerUrl != null
        ? Image.network(store.storeBannerUrl!, fit: BoxFit.cover)
        : Container(color: Colors.grey[200]);
  }

  Widget _buildStoreLogo() {
    return Positioned(
      bottom: -25,
      left: 16,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 3),
          shape: BoxShape.circle,
        ),
        child: store.storeLogoUrl != null
            ? CircleAvatar(backgroundImage: NetworkImage(store.storeLogoUrl!))
            : const CircleAvatar(child: Icon(Icons.store)),
      ),
    );
  }
}

// Reusable Components
class InfoCard extends StatelessWidget {
  final String title;
  final Widget child;

  const InfoCard({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const Divider(height: 24),
            child,
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.6),
                      ),
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final String platform;
  final String url;

  const SocialMediaButton(
      {super.key, required this.platform, required this.url});

  @override
  Widget build(BuildContext context) {
    final icon = _getPlatformIcon(platform);
    final color = _getPlatformColor(platform);

    return IconButton(
      icon: icon,
      iconSize: 32,
      color: color,
      onPressed: () => _launchSocialMedia(url),
    );
  }

  Widget _getPlatformIcon(String platform) {
    switch (platform.toLowerCase()) {
      case 'facebook':
        return SvgPicture.asset('assets/icons/facebook.svg',
            color: Colors.blue);
      case 'instagram':
        return SvgPicture.asset('assets/icons/instagram.svg',
            color: Colors.pink);
      case 'twitter':
        return SvgPicture.asset('assets/icons/twitter.svg', color: Colors.blue);
      default:
        return const Icon(Icons.link);
    }
  }

  Color _getPlatformColor(String platform) {
    switch (platform.toLowerCase()) {
      case 'facebook':
        return Colors.blue[800]!;
      case 'instagram':
        return Colors.pink;
      case 'twitter':
        return Colors.blue[400]!;
      default:
        return Colors.grey;
    }
  }

  void _launchSocialMedia(String url) {
    // Implement URL launching logic
  }
}
