

import 'package:attendance_mobile/app/infrastructures/endpoints.dart';
import 'package:attendance_mobile/data/infrastructures/api_service_interface.dart';
import 'package:attendance_mobile/data/payload/api/login_api_payload.dart';
import 'package:attendance_mobile/data/payload/contracts/auth_request.dart';
import 'package:attendance_mobile/data/persistences/mappers/auth_mapper.dart';
import 'package:attendance_mobile/domains/entities/user.dart';
import 'package:attendance_mobile/domains/repositories/auth_repository.dart';

class AuthApiRepository extends AuthRepository {
  ApiServiceInterface _service;
  Endpoints _endpoints;
  AuthMapper _mapper;

  AuthApiRepository(ApiServiceInterface service, Endpoints endpoints, AuthMapper mapper) {
    _service = service;
    _endpoints = endpoints;
    _mapper = mapper;
  }

  Future<Auth> login(LoginRequestInterface loginRequest) async {
    dynamic resp;
    try {
      resp = await _service.invokeHttp(
        _endpoints.login(), 
        RequestType.post,
        body: loginRequest as LoginApiRequest
      );
    } catch (error) {
      rethrow;
    }
    return _mapper.authApiConverter(resp);
  }
}