import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class ImageCacheService {
  const ImageCacheService();

  static final _log = Logger('ImageCacheService');

  void initialize() {
    const cacheSizeMB = 50;
    const cacheMaxSizeMB = 100;
    PaintingBinding.instance.imageCache.maximumSizeBytes = cacheSizeMB << 20;
    PaintingBinding.instance.imageCache.maximumSize = cacheMaxSizeMB;
    _log.info('Image cache size configured to $cacheSizeMB MB.');
  }

  static void clear() {
    imageCache
      ..clear()
      ..clearLiveImages();
    _log.info('Image cache cleared.');
  }
}
