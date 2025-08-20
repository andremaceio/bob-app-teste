[app]
title = bob app
package.name = bobapp
package.domain = org.bobapp
source.dir = .
source.include_exts = py,png,jpg,kv,atlas
version = 1.0
requirements = python3,kivy,pillow
orientation = portrait
fullscreen = 0

# Configurações Android
android.permissions = INTERNET,WRITE_EXTERNAL_STORAGE
android.api = 33
android.minapi = 21
android.sdk = 33
android.ndk = 25b
android.arch = arm64-v8a
android.allow_backup = True
android.logcat_filters = *:S python:D
android.accept_sdk_license = True
android.private_storage = True

# Configurações de build
android.gradle_dependencies = androidx.webkit:webkit:1.4.0

# Configurações do Python
android.presplash_color = #FFFFFF
android.icon.filename = %(source.dir)s/icon.png
android.presplash.filename = %(source.dir)s/presplash.png

# Logs detalhados para debug
log_level = 2
