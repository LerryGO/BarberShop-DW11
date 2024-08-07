import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../core/restClient/rest_client.dart';
import '../../model/barbershop_model.dart';
import '../../model/user_model.dart';
import 'barbershop_repository.dart';

class BarbershopRepositoryImpl implements BarbershopRepository {
  final RestClient restClient;

  BarbershopRepositoryImpl({required this.restClient});

  @override
  Future<Either<RepositoryException, BarbershopModel>> getMyBarberShop(
      UserModel userModel) async {
    switch (userModel) {
      case UserModelADM():
        final Response(data: List(first: data)) = await restClient.auth.get(
          '/barbershop',
          queryParameters: {
            'user_id': '#userAuthRef',
          },
        );
        return Success(
          BarbershopModel.fromMap(data),
        );

      case UserModelEmployee():
        final Response(:data) = await restClient.auth.get(
          '/barbershop/${userModel.barbershopId}',
        );
        return Success(
          BarbershopModel.fromMap(data),
        );
    }
  }
}
