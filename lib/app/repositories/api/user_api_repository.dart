import 'package:attendance_mobile/app/infrastructures/endpoints.dart';
import 'package:attendance_mobile/data/infrastructures/api_service_interface.dart';
import 'package:attendance_mobile/data/persistences/mappers/user_mapper.dart';
import 'package:attendance_mobile/data/persistences/repositories/user_repositories.dart';
import 'package:attendance_mobile/domains/entities/user.dart';
import 'dart:developer' as developer;

class UserApiRepository extends UserRepository {
  UserMapper _mapper;
  ApiServiceInterface _service;
  Endpoints _endpoints;

  UserApiRepository(ApiServiceInterface service, Endpoints endpoints, UserMapper mapper) {
    _mapper = mapper;
    _service = service;
    _endpoints = endpoints;
  }

  Future<User> show() async {
    dynamic resp;
    try {
      resp = await _service.invokeHttp(_endpoints.user(), RequestType.get);
    } catch (error) {
      rethrow;
    }
    return _mapper.getUserApiConverter(resp);
  }


  @override
  Future<List<User>> getAll() {
    // TODO: implement getAll
    return null;
  }

  @override
  Future<bool> verifyUserByPassword(request) {
    // TODO: implement verifyUserByPassword
    return null;
  }


}