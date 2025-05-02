import 'package:deco_trade_hub/core/media/media_repository.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';

class StoreMediaController extends GetxController {
  final MediaRepository repo;

  StoreMediaController({required this.repo});

  /// Logic for uploading avatar
  bool avatarUrlLoading = false;

  String? _avatarUrl;

  get avatarUrl => _avatarUrl;

  void setAvatarUrl(String url) {
    // Append version query to bypass cache
    _avatarUrl = "$url?v=${DateTime.now().millisecondsSinceEpoch}";
    update();
  }

  /// Logic for uploading cover
  bool coverUrlLoading = false;

  String? _coverUrl;

  get coverUrl => _coverUrl;

  void setCoverUrl(String url) {
    _coverUrl = "$url?v=${DateTime.now().millisecondsSinceEpoch}";
    update();
  }

  Future<String> uploadAvatarImage(
    String path,
    String filePath,
    String type, {
    bool deleteExisting = true,
  }) async {
    avatarUrlLoading = true;
    update();
    final String url;
    try {
      url = await repo.uploadImage(
        path: path,
        filePath: filePath,
        deleteExisting: deleteExisting,
      );
      setAvatarUrl(url);
    } catch (e) {
      print('Error uploading avatar image: $e');
      rethrow;
    } finally {
      avatarUrlLoading = false;
      update();
    }
    return url;
  }

  Future<String> uploadCoverImage(
    String path,
    String filePath,
    String type, {
    bool deleteExisting = true,
  }) async {
    coverUrlLoading = true;
    update();

    final String url;
    try {
      url = await repo.uploadImage(
        path: path,
        filePath: filePath,
        deleteExisting: deleteExisting,
      );
      logE(url);
      setCoverUrl(url);
    } catch (e) {
      print('Error uploading cover image: $e');
      rethrow;
    } finally {
      coverUrlLoading = false;
      update();
    }
    return url;
  }
}
