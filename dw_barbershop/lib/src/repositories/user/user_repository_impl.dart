import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dw_barbershop/src/core/fp/nil.dart';

import '../../core/exceptions/auth_exception.dart';
import '../../core/exceptions/repository_exception.dart';
import '../../core/fp/either.dart';
import '../../core/restClient/rest_client.dart';
import '../../model/user_model.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient restClient;

  UserRepositoryImpl({required this.restClient});

  @override
  Future<Either<Exception, String>> login(String email, String password) async {
    try {
      final Response(:data) = await restClient.unAuth.post(
        '/auth',
        data: {
          'email': email,
          'password': password,
        },
      );

      return Success(data['access_token']);
    } on DioException catch (e, s) {
      if (e.response != null) {
        final Response(:statusCode) = e.response!;
        if (statusCode == HttpStatus.forbidden) {
          log('Login ou senha inválidos', error: e, stackTrace: s);
          return Failure(AuthUnauthorizedException());
        }
      }
      log('Erro ao realizar login', error: e, stackTrace: s);
      return Failure(AuthError(message: 'Erro ao realizar login'));
    }
  }

  @override
  Future<Either<RepositoryException, UserModel>> me() async {
    try {
      final Response(:data) = await restClient.auth.get('/me');

      return Success(UserModel.fromMap(data));
    } on DioException catch (e, s) {
      log('Erro ao buscar o usuário logado', error: e, stackTrace: s);
      return Failure(
        RepositoryException(message: 'Erro ao buscar usuário logado'),
      );
    } on ArgumentError catch (e, s) {
      log('Invalid Json', error: e, stackTrace: s);
      return Failure(
        RepositoryException(message: e.message),
      );
    }
  }

  @override
  Future<Either<RepositoryException, Nil>> registerAdmin(
      ({String email, String name, String password}) userData) async {
    try {
      await restClient.unAuth.post('/users', data: {
        'name': userData.name,
        'email': userData.email,
        'password': userData.password,
        'profile': 'ADM',
      });

      return Success(nil);
    } on DioException catch (e, s) {
      log('Erro ao registrar usuário admin', error: e, stackTrace: s);
      return Failure(
        RepositoryException(message: 'Erro ao registrar usuário admin'),
      );
    }
  }
}
