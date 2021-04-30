package com.example.wallpapertest

import android.app.WallpaperManager
import android.content.Context
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.io.IOException

class MainActivity: FlutterActivity() {
    private val channel = "wallpapertest"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        val plugin = WallpaperManagerPlugin()
        val registry = flutterEngine.plugins
        registry.add(plugin)
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channel).setMethodCallHandler { call, result ->
            plugin.onMethodCall(call, result)
        }
      }
}

class WallpaperManagerPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var context: Context

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        val methodChannel = MethodChannel(binding.binaryMessenger, "wallpapertest")
        methodChannel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "setWallpaper" -> {
                try {
                    val wm = WallpaperManager.getInstance(context)
                    val stream = call.argument<ByteArray>("data")!!.inputStream()
                    wm.setStream(stream)
                } catch (e: IOException) {
                    e.printStackTrace()
                }
            }
        }
    }
}
