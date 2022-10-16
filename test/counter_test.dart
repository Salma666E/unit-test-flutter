import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:test/counter.dart';

void main() {
  group('Counter', () {
    test('Counter value should be incremented', () {
      final counter = Counter();

      counter.increment();

      expect(Counter().value, 0);

      expect(counter.value, 1); // expect == المتوقع
    });
    test('value should be decremented', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}
