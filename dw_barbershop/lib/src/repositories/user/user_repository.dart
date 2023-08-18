import 'package:dw_barbershop/src/core/fp/either.dart';

abstract interface class UserRepository {
  Future<Either<Exception, String>> login(String email, String password);
}