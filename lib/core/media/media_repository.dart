abstract class MediaRepository {
  Future<String> uploadImage({
    required String path,
    required String filePath,
    bool deleteExisting = false,
  });

  Future<void> deleteImage(String path);

  String getPublicUrl(String path);

  Future<List<String>> listImages(String prefixPath);
}
