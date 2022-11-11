import 'package:mi_learning/app/test/domain/entities/home_entity.dart';

class TestConnectionModel extends TestEntity {
  TestConnectionModel._internal(String message) : super(message);

  // Raw data is the data field inside the response
  factory TestConnectionModel.fromRawData(dynamic rawData) {
    if (rawData is String) {
      return TestConnectionModel._internal(rawData);
    } else {
      return TestConnectionModel._internal(rawData['data']);
    }
  }
}
