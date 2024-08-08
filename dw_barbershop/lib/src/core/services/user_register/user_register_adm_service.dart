import '../../exceptions/service_exception.dart';
import '../../fp/either.dart';
import '../../fp/nil.dart';

abstract interface class UserRegisterAdmService {
  Future<Either<ServiceException, Nil>> execute(
      ({String name, String email, String password}) userData);
}
