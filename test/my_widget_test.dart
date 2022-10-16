// Build the widget using the WidgetTester.
// Search for the widget using a Finder.
// Verify the widget using a Matcher.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test/my_widget.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows you to build and interact
  // with widgets in the test environment.
  testWidgets('MyWidget has a title and message', (tester) async {
    // Test code goes here.
    // Create the widget by telling the tester to build it.
    // Renders the UI from the given widget . Calls runApp with the given widget,
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.

    //findsNothing: Verifies that no widgets are found.
    //findsWidgets: Verifies that one or more widgets are found.
    //findsNWidgets: Verifies that a specific number of widgets are found.
    //matchesGoldenFile: Verifies that a widget’s rendering matches a particular bitmap image (“golden file” testing).

    expect(titleFinder, findsOneWidget);
    expect(messageFinder,
        findsOneWidget); // Find a widget that displays the letter 'M'.
  });
  testWidgets('finds a widget using a Key', (tester) async {
    // Define the test key.
    const testKey = Key('K');

    // Build a MaterialApp with the testKey.
    await tester.pumpWidget(MaterialApp(key: testKey, home: Container()));

    // Find the MaterialApp widget using the testKey.
    expect(find.byKey(testKey), findsOneWidget);
  });
  testWidgets('finds a specific instance', (tester) async {
    const childWidget = Padding(padding: EdgeInsets.zero);

    // Provide the childWidget to the Container.
    await tester.pumpWidget(Container(child: childWidget));

    // Search for the childWidget in the tree and verify it exists.
    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
