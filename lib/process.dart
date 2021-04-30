import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

const methodChannel = MethodChannel('wallpapertest');

Future<void> setWallpaperManager(int id) async {
  await WallpaperManager.setWallpaperFromAsset(
    'assets/$id.jpg',
    WallpaperManager.BOTH_SCREENS,
  );
}

Uint8List calcBytes(ByteData data) {
  return data.buffer.asUint8List();
}

Future<void> setWithIsolate(int id) async {
  final uint = await rootBundle.load('assets/$id.jpg');
  final data = await compute(calcBytes, uint);
  methodChannel.invokeMethod('setWallpaper', {
    'data': data,
  });
}
