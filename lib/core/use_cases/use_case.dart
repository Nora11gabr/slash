import 'package:dartz/dartz.dart';
import 'package:slashapp/core/errors/failures.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param? param]);
}

class NoParam {}
