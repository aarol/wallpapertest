import 'package:flutter/material.dart';
import 'package:wallpapertest/process.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setAssetWallpaperManager(1);
                },
                child: Text('wallpaper_manager 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  setAssetWallpaperManager(2);
                },
                child: Text('wallpaper_manager 2'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setAsset(1);
                },
                child: Text('set asset 1'),
              ),
              SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: () {
                  setAsset(2);
                },
                child: Text('set asset 2'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setFileWallpaperManager();
            },
            child: Text('wallpaper_manager file'),
          ),
          ElevatedButton(
            onPressed: () {
              setFile();
            },
            child: Text('set file'),
          ),
        ],
      ),
    );
  }
}
