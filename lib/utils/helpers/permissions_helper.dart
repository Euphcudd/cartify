import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<bool> requestStoragePermission() async {
    final status = await Permission.storage.request();
    return status.isGranted;
  }

  static Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }

  static Future<bool> requestPhotosPermission() async {
    final status = await Permission.photos.request(); // For iOS
    return status.isGranted;
  }

  static Future<bool> requestMediaLibraryPermission() async {
    final status = await Permission.mediaLibrary.request(); // iOS old
    return status.isGranted;
  }
}
