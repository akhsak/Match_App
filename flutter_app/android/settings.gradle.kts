pluginManagement {
    val flutterSdkPath =
        run {
            val properties = java.util.Properties()
            file("local.properties").inputStream().use { properties.load(it) }
            val flutterSdkPath = properties.getProperty("flutter.sdk")
            require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
            flutterSdkPath
        }

    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

plugins {
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    // Keep these aligned with Flutter plugins such as shared_preferences.
    // AGP 9 is not yet compatible with the Android plugin ecosystem used here.
    id("com.android.application") version "8.13.1" apply false
    id("org.jetbrains.kotlin.android") version "2.3.0" apply false
}

include(":app")
