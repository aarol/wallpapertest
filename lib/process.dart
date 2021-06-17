import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

const methodChannel = MethodChannel('wallpapertest');

Future<void> setAssetWallpaperManager(int id) async {
  await WallpaperManager.setWallpaperFromAsset(
    'assets/$id.jpg',
    WallpaperManager.BOTH_SCREENS,
  );
}

Future<void> setFileWallpaperManager() async {
  final file = await ImagePicker().getImage(source: ImageSource.gallery);
  await WallpaperManager.setWallpaperFromFile(
    file.path,
    WallpaperManager.BOTH_SCREENS,
  );
}

Uint8List calcBytes(ByteData data) {
  return data.buffer.asUint8List();
}

Future<Uint8List> readBytesFrom(PickedFile file) {
  return file.readAsBytes();
}

Future<void> setFile() async {
  final file = await ImagePicker().getImage(source: ImageSource.gallery);
  final data = await compute(readBytesFrom, file);
  sendInvocation(data);
}

Future<void> setAsset(int id) async {
  final uint = await rootBundle.load('assets/$id.jpg');
  final data = await compute(calcBytes, uint);
  sendInvocation(data);
}

void sendInvocation(Uint8List data) {
  methodChannel.invokeMethod('setWallpaper', {
    'data': data,
  });
}
