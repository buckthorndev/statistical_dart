import 'package:test/test.dart';
import 'package:statistical_dart/statistical_dart.dart';

void main() {
  group('Statistical Dart', () {
    test('Arr Min', () {
      Statistical statistical = Statistical();
      print(statistical.arrMin([1,6,7,8,9,0,-10,-1]));
    });
  });
}
