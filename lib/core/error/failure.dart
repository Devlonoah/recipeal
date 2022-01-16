import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class NetworkFailure extends Failure {}

class CachedFailure extends Failure {}

class ServerFailure extends Failure {}
