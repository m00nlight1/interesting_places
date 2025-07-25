import 'package:interesting_places/core/domain/entities/failure/failure.dart';
import 'package:interesting_places/core/domain/entities/result/result.dart';

typedef RequestOperation<T> = Future<Result<T, Failure>>;
