import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class FirebaseHelper {
  // Firebase Auth
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static User? get currentUser => _auth.currentUser;
  static String? get userId => currentUser?.uid;
  static String get userEmail => currentUser?.email ?? '';
  static bool get isLoggedIn => currentUser != null;

  // Firebase Storage
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Uploads a file to a given storage [path] and returns the download URL.
  static Future<String?> uploadFile(File file, String path) async {
    try {
      final ext = file.path.split('.').last;
      final fileName = '${const Uuid().v4()}.$ext';
      final ref = _storage.ref().child('$path/$fileName');
      await ref.putFile(file);
      final downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Upload failed: $e');
      return null;
    }
  }

  /// Upload with progress if needed (optional)
  static UploadTask uploadWithProgress(File file, String path) {
    final ext = file.path.split('.').last;
    final fileName = '${const Uuid().v4()}.$ext';
    final ref = _storage.ref().child('$path/$fileName');
    return ref.putFile(file);
  }

  /// Delete a file using full storage URL
  static Future<void> deleteFile(String downloadUrl) async {
    try {
      final ref = _storage.refFromURL(downloadUrl);
      await ref.delete();
    } catch (e) {
      print('Delete failed: $e');
    }
  }
}
