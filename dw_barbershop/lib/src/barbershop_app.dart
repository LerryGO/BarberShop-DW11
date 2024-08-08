import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';

import 'core/ui/barbershop_nav_global_key.dart';
import 'core/ui/barbershop_theme.dart';
import 'core/ui/widgets/barbershop_loader.dart';
import 'features/auth/login/login_page.dart';
import 'features/auth/register/user_register_page.dart';
import 'features/splash/splash_page.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const BarbershopLoader(),
      builder: (asyncNavigatorObserver) {
        return MaterialApp(
          title: 'DW Barbershop',
          theme: BarbershopTheme.themeData,
          navigatorObservers: [asyncNavigatorObserver],
          navigatorKey: BarbershopNavGlobalKey.instance.navKey,
          routes: {
            '/': (_) => const SplashPage(),
            '/auth/login': (_) => const LoginPage(),
            '/auth/register/user': (_) => const UserRegisterPage(),
            '/auth/register/barbershop': (_) => const Text('Barbershop Page'),
            '/home/adm': (_) => const LoginPage(),
            '/home/employee': (_) => const LoginPage(),
          },
        );
      },
    );
  }
}
