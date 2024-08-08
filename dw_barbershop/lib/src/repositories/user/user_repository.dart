import 'package:dw_barbershop/src/core/fp/nil.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../model/user_model.dart';

abstract interface class UserRepository {
  Future<Either<Exception, String>> login(String email, String password);

  Future<Either<RepositoryException, UserModel>> me();

  Future<Either<RepositoryException, Nil>> registerAdmin(
      ({String name, String email, String password}) userData);
}
