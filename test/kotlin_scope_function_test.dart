import 'package:flutter_test/flutter_test.dart';

import 'package:kotlin_scope_function/kotlin_scope_function.dart';

void main() {
  test(".let is workable.", () {
    final defValue = 10;

    //test .let return a int with addition operation
    var result = defValue.let((it) {
      return it + 5;
    });
    expect(result, 15);

    //test .let return a string
    result = defValue.let((it) {
      return "${it + 10}";
    });
    expect(result, "20");

    //test .let can return null
    result = defValue.let((it) {
      return null;
    });
    expect(result, isNull);
  });

  test("run is workable.", () {
    //test run return a int with addition operation
    int a = 10;
    var result = run(() {
      int b = 5;
      return a + b;
    });
    expect(result, 15);

    //test run return a string
    int c = 10;
    result = run(() {
      int d = 10;
      return "${c + d}";
    });
    expect(result, "20");

    //test run can return null
    result = run(() {
      return null;
    });
    expect(result, isNull);
  });

  test(".also us workable.", () {
    final list = [];
    final firstElement = "first element";
    list.also((it) {
      it.add(firstElement);
    });
    expect(list, hasLength(1));
    expect(list[0], firstElement);

    final secondElement = "second element";
    list.also((it) {
      it.add(secondElement);
    });
    expect(list, hasLength(2));
    expect(list[1], secondElement);
  });

  test(".takeIf", () {
    final list = [];
    var result = list.takeIf((it) {
      return it.isEmpty;
    });
    expect(result, list);

    result = list.takeIf((it) {
      return it.isNotEmpty;
    });
    expect(result, isNull);
  });

  test(".takeUnless", () {
    final list = [];
    var result = list.takeUnless((it) {
      return it.isNotEmpty;
    });
    expect(result, list);

    result = list.takeUnless((it) {
      return it.isEmpty;
    });
    expect(result, isNull);
  });
}
