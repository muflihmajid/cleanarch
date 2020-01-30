import 'dart:async';

import 'package:attendance_mobile/data/persistences/persistence/static_content_repository.dart';
import 'package:attendance_mobile/domains/entities/static_content.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:rxdart/rxdart.dart' as RxDart;


// Declaring usecase of the entity
class GetStaticContentUseCase extends UseCase<StaticContent, String> {
  StaticContentRepository _repository;

  GetStaticContentUseCase(this._repository);

  @override
  Future<Stream<StaticContent>> buildUseCaseStream(String name) async {
    final StreamController<StaticContent> _controller = StreamController();    
    try {
      StaticContent content = await _repository.show(name);
      _controller.add(content);
      _controller.close();
    } catch (e) {
      print(e);
      _controller.addError(e);
    }
    return _controller.stream;
  }
}
