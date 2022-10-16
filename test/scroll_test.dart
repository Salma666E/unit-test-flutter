//This is useful because the height of the items in the list can change depending on the device.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test/my_scroll.dart';

void main() {
  testWidgets('Scroll test', (tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyScroll(
      items: List<String>.generate(1000, (i) => 'Item $i'),
    ));

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('item_50_text'));
    //scrollUntilVisible 0, 1, ... ,9
    //scrollUntilUnvisitable 10, 11, ... ,1000

    //كان بيعطى ايرور لحد مكتبنا هذا السطر  => scrollUntilVisible
    // Scroll until the item to be found appears.
    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: listFinder,
    );

    // Verify that the item contains the correct text.
    expect(itemFinder, findsOneWidget);
  });
}
