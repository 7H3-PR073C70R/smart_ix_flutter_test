// ignore_for_file: one_member_abstracts

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_ix_takehome/src/core/error/failure.dart';

///
/// Usecase is called with Failure or some type of data representation
///
///
abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

///
/// No params if the data object is in local cache
///
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
