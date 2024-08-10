import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../core/fp/nil.dart';
import '../../model/barbershop_model.dart';
import '../../model/user_model.dart';

abstract interface class BarbershopRepository {
  Future<Either<RepositoryException, Nil>> save(
      ({
        String name,
        String email,
        List<String> openingDays,
        List<int> openingHours,
      }) data);

  Future<Either<RepositoryException, BarbershopModel>> getMyBarberShop(
      UserModel userModel);
}
