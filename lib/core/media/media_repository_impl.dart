import 'dart:io';

import 'package:shared/shared.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'media_repository.dart';

class MediaRepositoryImpl implements MediaRepository {
  final SupabaseClient client;

  MediaRepositoryImpl(this.client);

  @override
  Future<String> uploadImage({
    required String path,
    required String filePath,
    bool deleteExisting = false,
  }) async {
    try {
      final storage = client.storage.from('media');

      if (deleteExisting) {
        try {
          logE('trying to remove existing');
          await storage.remove([path]);
        } catch (e) {
          print('Error deleting existing file: $e');
        }
      }

      final file = File(filePath);
      logE('uploading image to $path');
      await storage.upload(path, file,
          fileOptions: const FileOptions(upsert: true));
      logE('getting public url');

      return getPublicUrl(path);
    } catch (e) {
      print('Error uploading image: $e');
      rethrow;
    }
  }

  @override
  Future<void> deleteImage(String path) async {
    await client.storage.from('media').remove([path]);
  }

  @override
  String getPublicUrl(String path) {
    return client.storage.from('media').getPublicUrl(path);
  }

  @override
  Future<List<String>> listImages(String prefixPath) async {
    final result = await client.storage.from('media').list(path: prefixPath);
    return result.map((f) => getPublicUrl('$prefixPath/${f.name}')).toList();
  }
}
