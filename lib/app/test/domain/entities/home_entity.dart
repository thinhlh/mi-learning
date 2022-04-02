import 'package:mi_learning/base/domain/entity/base_entity.dart';

class TestEntity extends BaseEntity {
  final String message;
  TestEntity(this.message);
  @override
  List<Object?> get props => [message];
}
