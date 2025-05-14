// lib/core/usecases/usecase.dart (if not already present)
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery_app/core/error/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}