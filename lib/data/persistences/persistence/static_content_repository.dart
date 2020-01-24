
// Declaring interface that the entity should be implemented
import 'package:attendance_mobile/domains/entities/static_content.dart';

abstract class StaticContentRepository {
  Future<StaticContent> show(String name);
}
