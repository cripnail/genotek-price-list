import 'package:genotek/core/constants/strings.dart';

class ServerException implements Exception {
  final String? message;

  ServerException([this.message]);

  @override
  String toString() => message ?? Strings.serverError;
}
