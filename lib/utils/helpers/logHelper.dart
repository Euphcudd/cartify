import 'package:flutter/material.dart';

class Log {
  static void i(String message) {
    debugPrint('ℹ️ $message');
  }

  static void e(String error) {
    debugPrint('❌ $error');
  }

  static void success(String message) {
    debugPrint('✅ $message');
  }
}
