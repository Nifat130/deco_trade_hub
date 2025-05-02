import 'package:deco_trade_hub/core/media/media_repository_impl.dart';
import 'package:deco_trade_hub/features/store/presentation/shared/controllers/store_media_controller.dart'
    show StoreMediaController;
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StoreAvatarUploader extends StatefulWidget {
  final Function(String imageUrl) onImageUploaded;

  const StoreAvatarUploader({
    super.key,
    required this.onImageUploaded,
  });

  @override
  State<StoreAvatarUploader> createState() => _StoreAvatarUploaderState();
}

class _StoreAvatarUploaderState extends State<StoreAvatarUploader> {
  @override
  initState() {
    super.initState();
    Get.put(StoreMediaController(
        repo: MediaRepositoryImpl(Supabase.instance.client)));
  }

  @override
  dispose() {
    Get.delete<StoreMediaController>();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final userId = Supabase.instance.client.auth.currentUser!.id;
    return GetBuilder<StoreMediaController>(
      builder: (controller) {
        final isUploading = controller.avatarUrlLoading;
        final theme = Theme.of(context);

        return Center(
          child: Row(
            spacing: 12,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildModernPreviewArea(
                  context, controller, isUploading, userId, theme),
              Expanded(child: _buildModernInstructionText(context, theme)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildModernPreviewArea(
      BuildContext context,
      StoreMediaController controller,
      bool isUploading,
      String userId,
      ThemeData theme) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => _handleImageSelection(controller, userId),
        child: SizedBox(
          width: 120,
          height: 120,
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(20),
            dashPattern: const [6, 4],
            color: theme.colorScheme.primary.withValues(alpha: .3),
            strokeWidth: 1.5,
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _buildModernImagePreview(controller, theme),

                  if (isUploading) _buildModernUploadingOverlay(theme),

                  Positioned.fill(
                    child: AnimatedOpacity(
                      opacity:
                          controller.avatarUrl == null || isUploading ? 1 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Container(
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
                        child: _buildModernUploadContent(theme, isUploading),
                      ),
                    ),
                  ),

                  // Edit Hover Overlay
                  if (controller.avatarUrl != null && !isUploading)
                    Positioned.fill(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: .3),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.edit_rounded,
                            color: Colors.white,
                            size: 24,
                            shadows: [
                              Shadow(
                                  color: Colors.black.withValues(alpha: .2),
                                  blurRadius: 4)
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModernImagePreview(
      StoreMediaController controller, ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: .03),
        borderRadius: BorderRadius.circular(18),
      ),
      child: controller.avatarUrl != null
          ? Image.network(
              controller.avatarUrl!,
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
                  _buildModernErrorPlaceholder(theme),
            )
          : null,
    );
  }

  Widget _buildModernUploadContent(ThemeData theme, bool isUploading) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: isUploading
              ? SizedBox(
                  width: 40,
                  height: 40,
                  child: CupertinoActivityIndicator(
                    color: theme.colorScheme.primary,
                  ),
                )
              : Icon(
                  Icons.photo_camera_back_rounded,
                  size: 32,
                  color: theme.colorScheme.primary.withValues(alpha: .8),
                ),
        ),
        const SizedBox(height: 8),
        Text(
          isUploading ? 'Uploading...' : 'Add Store Photo',
          style: theme.textTheme.bodyMedium?.copyWith(
            fontSize: 13,
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

  Widget _buildModernUploadingOverlay(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .95),
        borderRadius: BorderRadius.circular(18),
      ),
    );
  }

  Widget _buildModernErrorPlaceholder(ThemeData theme) {
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

  Widget _buildModernInstructionText(BuildContext context, ThemeData theme) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: .6),
          height: 1.4,
        ),
        children: const [
          TextSpan(text: 'Recommended: Square image (800×800px)\n'),
          TextSpan(
              text: 'Formats: JPG, PNG, WEBP • ',
              style: TextStyle(fontWeight: FontWeight.w400)),
          TextSpan(
              text: 'Max 5MB', style: TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Future<void> _handleImageSelection(
      StoreMediaController controller, String userId) async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image == null) return;

    final filePath = image.path;
    final fileExtension = filePath.split('.').last;
    final fileName = 'avatar.$fileExtension';

    final storagePath = 'media/stores/$userId/avatar/$fileName';

    try {
      final imageUrl = await controller.uploadAvatarImage(
        storagePath,
        filePath,
        fileExtension,
      );

      widget.onImageUploaded(imageUrl);
    } catch (e) {
      Get.snackbar(
        'Upload Failed',
        'Something went wrong while uploading your image.',
        backgroundColor: Colors.red.shade400,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
