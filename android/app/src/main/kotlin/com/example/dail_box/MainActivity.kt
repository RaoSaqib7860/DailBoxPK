package com.dialbox.pk

import io.flutter.embedding.android.FlutterActivity

import io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingBackgroundService


class Application : FlutterApplication(), PluginRegistrantCallback {
    // ...
    @Override
    fun onCreate() {
        super.onCreate()
        FlutterFirebaseMessagingBackgroundService.setPluginRegistrant(this)
    }

    @Override
    fun registerWith(registry: PluginRegistry?) {
        GeneratedPluginRegistrant.registerWith(registry)
    } // ...
}
