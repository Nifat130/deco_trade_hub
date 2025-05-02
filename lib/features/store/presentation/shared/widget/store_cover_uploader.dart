import 'package:deco_trade_hub/core/media/media_repository_impl.dart';
import 'package:deco_trade_hub/features/store/presentation/shared/controllers/store_media_controller.dart'
    show StoreMediaController;
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StoreCoverUploader extends StatefulWidget {
  final Function(String imageUrl) onImageUploaded;

  const StoreCoverUploader({
    super.key,
    required this.onImageUploaded,
  });

  @override
  State<StoreCoverUploader> createState() => _StoreCoverUploaderState();
}

class _StoreCoverUploaderState extends State<StoreCoverUploader> {
  @override
  void initState() {
    super.initState();
    Get.put(StoreMediaController(
      repo: MediaRepositoryImpl(Supabase.instance.client),
    ));
  }

  @override
  void dispose() {
    Get.delete<StoreMediaController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userId = Supabase.instance.client.auth.currentUser!.id;
    return GetBuilder<StoreMediaController>(
      builder: (controller) {
        final isUploading = controller.coverUrlLoading;
        final theme = Theme.of(context);

        return Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            _buildPreviewArea(context, controller, isUploading, userId, theme),
            _buildInstructionText(context, theme),
          ],
        );
      },
    );
  }

  Widget _buildPreviewArea(
    BuildContext context,
    StoreMediaController controller,
    bool isUploading,
    String userId,
    ThemeData theme,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _handleImageSelection(controller, userId),
        child: SizedBox(
          width: double.infinity,
          height: 120,
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(16),
            dashPattern: const [6, 4],
            color: theme.colorScheme.primary.withValues(alpha: .3),
            strokeWidth: 1.5,
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _buildImagePreview(controller, theme),
                  if (isUploading) _buildUploadingOverlay(theme),
                  Positioned.fill(
                    child: AnimatedOpacity(
                      opacity:
                          controller.coverUrl == null || isUploading ? 1 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: _buildUploadOverlayContent(theme, isUploading),
                    ),
                  ),
                  if (controller.coverUrl != null && !isUploading)
                    _buildEditIconOverlay(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImagePreview(StoreMediaController controller, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: .03),
        borderRadius: BorderRadius.circular(14),
      ),
      child: controller.coverUrl != null
          ? Image.network(
              controller.coverUrl!,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                    strokeWidth: 2,
                    color: theme.colorScheme.primary,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) =>
                  _buildErrorPlaceholder(theme),
            )
          : null,
    );
  }

  Widget _buildUploadOverlayContent(ThemeData theme, bool isUploading) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            theme.colorScheme.primary.withValues(alpha: .1),
            theme.colorScheme.primary.withValues(alpha: .05),
          ],
        ),
      ),
      child: _buildUploadContent(theme, isUploading),
    );
  }

  Widget _buildUploadContent(ThemeData theme, bool isUploading) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isUploading
              ? SizedBox(
                  width: 48,
                  height: 48,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: theme.colorScheme.primary,
                  ),
                )
              : Icon(
                  Icons.landscape_rounded,
                  size: 42,
                  color: theme.colorScheme.primary.withValues(alpha: .8),
                ),
        ),
        Text(
          isUploading ? 'Uploading...' : 'Add Store Cover',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.primary.withValues(alpha: .9),
            fontWeight: FontWeight.w600,
          ),
        ),
        if (!isUploading) ...[
          const SizedBox(height: 4),
          Text(
            'Tap to upload',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: .6),
              fontSize: 12,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildUploadingOverlay(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .95),
        borderRadius: BorderRadius.circular(14),
      ),
    );
  }

  Widget _buildErrorPlaceholder(ThemeData theme) {
    return Container(
      color: theme.colorScheme.errorContainer.withValues(alpha: .1),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline_rounded,
              color: theme.colorScheme.error,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              'Failed to load image',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstructionText(BuildContext context, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: .6),
            height: 1.4,
          ),
          children: const [
            TextSpan(text: 'Recommended: Wide image (1200×400px)\n'),
            TextSpan(
              text: 'Formats: JPG, PNG, WEBP • ',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: 'Max 5MB',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditIconOverlay() {
    return Positioned.fill(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: .3),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Icon(
            Icons.edit_rounded,
            color: Colors.white,
            size: 28,
            shadows: [
              Shadow(
                color: Colors.black.withValues(alpha: .2),
                blurRadius: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleImageSelection(
      StoreMediaController controller, String userId) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      final path = 'media/stores/$userId/cover/cover.png';
      final url = await controller.uploadCoverImage(path, image.path, 'cover');
      widget.onImageUploaded(url);
    }
  }
}
