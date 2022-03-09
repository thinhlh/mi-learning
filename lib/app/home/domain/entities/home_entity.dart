import 'package:mi_learning/base/domain/entity/base_entity.dart';

class HomeEntity extends BaseEntity {
  final String message;
  HomeEntity(this.message);
  @override
  List<Object?> get props => [message];
}
