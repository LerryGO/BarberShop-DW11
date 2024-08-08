import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/application_providers.dart';
import '../../../core/services/user_register/user_register_adm_service.dart';
import '../../../core/services/user_register/user_register_adm_service_impl.dart';

part 'user_register_providers.g.dart';

@riverpod
UserRegisterAdmService userRegisterAdmService(UserRegisterAdmServiceRef ref) =>
    UserRegisterAdmServiceImpl(
        userRepository: ref.watch(userRepositoryProvider),
        userLoginService: ref.watch(userLoginServiceProvider));
