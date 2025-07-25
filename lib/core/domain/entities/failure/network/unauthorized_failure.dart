import 'package:interesting_places/core/domain/entities/failure/network/network_failure.dart';

/// Ошибка авторизации.
final class UnauthorizedFailure extends NetworkFailure {
  const UnauthorizedFailure() : super(message: 'Unauthorized');
}
