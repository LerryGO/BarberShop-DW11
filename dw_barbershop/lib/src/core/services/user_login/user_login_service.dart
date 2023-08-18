import 'package:dw_barbershop/src/core/exceptions/service_exception.dart';
import '../../fp/either.dart';
import '../../fp/nil.dart';

abstract interface class UserLoginService{
  Future<Either<ServiceException,Nil>> execute (String email, String password);
}