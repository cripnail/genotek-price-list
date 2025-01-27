import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';
import 'package:genotek/core/constants/strings.dart';

class Logger {
  static void log(String message, {String? name, Object? error}) {
    if (kDebugMode) {
      developer.log(
        message,
        name: name ?? Strings.defaultLoggerName,
        error: error,
      );
    }
  }
}
