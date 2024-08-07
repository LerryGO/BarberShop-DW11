import 'package:asyncstate/asyncstate.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/exceptions/service_exception.dart';
import '../../../core/fp/either.dart';
import '../../../core/providers/application_providers.dart';
import '../../../model/user_model.dart';
import 'login_state.dart';

part 'login_vm.g.dart';

@riverpod
class LoginVm extends _$LoginVm {
  @override
  LoginState build() => LoginState.initial();

  Future<void> login(String email, String password) async {
    final loaderHandler = AsyncLoaderHandler()..start();

    final loginService = ref.watch(userLoginServiceProvider);

    final result = loginService.execute(email, password);

    switch (result) {
      case Success():
        // Invalidadando os cache para evitar o login com o usuário errado!
        ref.invalidate(getMeProvider);
        ref.invalidate(getMyBarbershopProvider);
        // buscar dados do usuário logado
        // Fazer uma analise para qual o tipo do login
        final userModel = await ref.read(getMeProvider.future);
        switch (userModel) {
          case UserModelADM():
            state = state.copyWith(status: LoginStateStatus.admLogin);
          case UserModelEmployee():
        }
        break;
      case Failure(exception: ServiceException(:final message)):
        state = state.copyWith(
          status: LoginStateStatus.error,
          errorMessage: () => message,
        );
    }

    loaderHandler.close();
  }
}
