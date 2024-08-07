import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../model/barbershop_model.dart';
import '../../model/user_model.dart';
import '../../repositories/barbershop/barbershop_repository.dart';
import '../../repositories/barbershop/barbershop_repository_impl.dart';
import '../../repositories/user/user_repository.dart';
import '../../repositories/user/user_repository_impl.dart';
import '../fp/either.dart';
import '../restClient/rest_client.dart';
import '../services/user_login/user_login_service.dart';
import '../services/user_login/user_login_service_impl.dart';

part 'application_providers.g.dart';

@Riverpod(keepAlive: true)
RestClient restClient(RestClientRef ref) => RestClient();

@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) =>
    UserRepositoryImpl(restClient: ref.read(restClientProvider));

@Riverpod(keepAlive: true)
UserLoginService userLoginService(UserLoginServiceRef ref) =>
    UserLoginServiceImpl(userRepository: ref.read(userRepositoryProvider));

@Riverpod(keepAlive: true)
Future<UserModel> getMe(GetMeRef ref) async {
  final result = await ref.watch(userRepositoryProvider).me();

  return switch (result) {
    Success(value: final userModel) => userModel,
    Failure(:final exception) => throw exception,
  };
}

@Riverpod(keepAlive: true)
BarbershopRepository barbershopRepository(BarbershopRepositoryRef ref) =>
    BarbershopRepositoryImpl(restClient: ref.watch(restClientProvider));

@Riverpod(keepAlive: true)
Future<BarbershopModel> getMyBarbershop(GetMyBarbershopRef ref) async {
  final userModel = await ref.watch(getMeProvider.future);
  final barbershopRepository = ref.watch(barbershopRepositoryProvider);

  final result = await barbershopRepository.getMyBarberShop(userModel);

  return switch (result) {
    Success(value: final barbershop) => barbershop,
    Failure(:final exception) => throw exception
  };
}
