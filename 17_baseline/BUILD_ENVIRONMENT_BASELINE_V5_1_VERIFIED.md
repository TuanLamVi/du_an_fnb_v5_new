F# BUILD ENVIRONMENT BASELINE V5.1 — VERIFIED & LOCKED

- **STATUS**: `VERIFIED`
- **VERIFICATION METHOD**: Successful `flutter build appbundle --release`
- **VERIFIED VERSION**: `5.1.0+14`
- **AAB SIZE**: `46.63 MB`
- **VERIFIED DATE**: `2026-10-08`
- **Repository**: `https://github.com/TuanLamVi/fnb-smart-v5.git` (Branch: `main`, HEAD: `515a6e0e10d50f5353125aa59f4d34dd1ae26f49`)

---

## 1. OFFICIAL TOOLCHAIN & RUNTIME BASELINE
- **Flutter**: `3.41.0` (Channel: stable)
- **Flutter Root**: `C:\Users\Admin\Desktop\flutter_windows_3.41.0-stable\flutter`
- **Dart**: `3.11.0`
- **JDK / Java**: `17.0.20.1` (Eclipse Adoptium)
- **JAVA_HOME**: `C:\Users\Admin\AppData\Local\Programs\Eclipse Adoptium\jdk-17.0.20.101-hotspot\`
- **Android SDK**: `C:\Users\Admin\AppData\Local\Android\Sdk`
- **compileSdk**: `36`
- **targetSdk**: `35`
- **minSdk**: `24`
- **Android Gradle Plugin (AGP)**: `8.11.1`
- **Gradle**: `8.14`
- **Kotlin**: `2.2.20`

---

## 2. ENVIRONMENT VARIABLES & PATHS
- **PUB_CACHE**: `C:\Users\Admin\Desktop\Pub\Cache`
- **Required PowerShell setup before build**:
  ```powershell
  $env:PUB_CACHE="C:\Users\Admin\Desktop\Pub\Cache"
  $env:ANDROID_PREFS_ROOT=""
  ```

---

## 3. VERIFIED RELEASE ARTIFACT
- **AAB Path**: `build\app\outputs\bundle\release\app-release.aab`
- **File Size**: `46.63 MB`
- **Application ID**: `com.tuan.fnbsmart`
- **VersionName**: `5.1.0`
- **VersionCode**: `14`
- **Release Signing**: Verified (Key.properties configured)

---

## 4. RULES FOR FUTURE BUILDS
1. Always set `PUB_CACHE` and `ANDROID_PREFS_ROOT` as mandated above.
2. Do not upgrade/downgrade Flutter, Java, AGP, Gradle, or Kotlin without a formal Change Request.
3. Keep this environment baseline locked to guarantee deterministic, reproducible release builds.
