import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]) : super();

  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  final String message;
  const ServerFailure(this.message);
}

class InputFailure extends Failure {
  final String message;
  const InputFailure(this.message);
}

class CacheFailure extends Failure {
  final String message;

  const CacheFailure(this.message);
}
class NoConnectionFailure extends Failure {
  final String message;

  const NoConnectionFailure(this.message);
  
  
}
class LoignFailed extends Failure{
 final String message;

  const LoignFailed(this.message);
}
