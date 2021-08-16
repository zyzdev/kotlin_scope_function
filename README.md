# kotlin_scope_function

This is a utility package that providing [Kotlin scope function](https://kotlinlang.org/docs/scope-functions.html) implement by Dart.

## Getting Started

* import package to dart file
```dart
import 'package:kotlin_scope_function/kotlin_scope_function.dart';`
```

### .let

.let can be used to invoke one or more functions on results of call chains.

```dart
final defValue = 10;
var result = defValue.let((it) {
  final b = 5;
  return it + b + 5;
});

print(result);
```

### run

run is useful when your lambda contains both the object initialization and the computation of the return value.

```dart
final a = 10;
var result = run(() {
  final b = 5;
  return a + b + 5;
});

print(result);
```

### .also

also is good for performing some actions that take the context object as an argument.

```dart
List result = [];
result.also((it) {
  final b = 10;
  it.add(b);
  it.add(5);
});

print(result);
```

### .takeIf

takeIf returns object self if it matches the predicate. Otherwise, it returns null.

```dart
List ref = ["data"];
var result = ref.takeIf((it) {
  return it.isNotEmpty;
});

print(result);
```

### .takeIf

takeUnless returns object self if it doesn't matches the predicate. Otherwise, it returns null.

```dart
List ref = ["data"];
var result = ref.takeUnless((it) {
  return it.isEmpty;
});

print(result);
```

## Sample Usage

Run `example` to see usage shown above and modify the code to try your requirement.

## Unit Test

`$ flutter test test/kotlin_scope_function_test.dart`