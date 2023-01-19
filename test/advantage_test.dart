// setUp(body()) : is
// Registers a function to be run before tests.
// This function will be called before each test is run. The body may be asynchronous; if so, it must return a Future.
// If this is called within a test group, it applies only to tests in that group. The body will be run after any set-up callbacks in parent groups or at the top level.

import 'package:flutter_test/flutter_test.dart';

void main(List<String> args) {
  group('Testing App Provider', () {
    // var favorites = Favorites();
    var favorites = [];
    test('A new item should be added', () {
      var number = 35;
      favorites.add(number);
      expect(favorites.contains(number), true);
    });
    test('A item should be removed', () {
      var number = 35;
      favorites.remove(number);
      expect(favorites.contains(number), false);
    });
  });
}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/** pumpAndSettle method:
 * Future<int> pumpAndSettle(
 * [Duration duration = const Duration(milliseconds: 100),
 * EnginePhase phase = EnginePhase.sendSemanticsUpdate,
 * Duration timeout = const Duration(minutes: 10)] );
 * his essentially waits for all animations to have completed.
 * Repeatedly calls pump with the given duration until there are no longer any frames scheduled.
 * This will call pump at least once, even if no frames are scheduled when the function is called, to flush any pending microtasks which may themselves schedule a frame.
 */
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
