[app]
title = bob app
package.name = bobapp
package.domain = org.bobapp
source.dir = .
source.include_exts = py,png,jpg,kv,atlas
version = 1.0
requirements = python3,kivy
orientation = portrait
fullscreen = 0

# Configurações Android básicas
android.permissions = INTERNET
android.api = 28
android.minapi = 21
android.sdk = 28
android.ndk = 19b
android.arch = arm64-v8a
android.accept_sdk_license = True

# Logs detalhados para debug
log_level = 2
