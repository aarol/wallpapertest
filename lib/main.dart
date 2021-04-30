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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setWallpaperManager(1);
                },
                child: Text('wallpaper_manager 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  setWallpaperManager(2);
                },
                child: Text('wallpaper_manager 2'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  setWithIsolate(1);
                },
                child: Text('set with isolates 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  setWithIsolate(2);
                },
                child: Text('set with isolates 2'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
