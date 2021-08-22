library kotlin_scope_function;

extension ObjectE<T extends Object> on T {
  /// 'let' can be used to invoke one or more functions on results of call chains.
  /// [it] is the object self.
  /// [dealing] is a function with an argument [it] should return a 'value'.
  /// the 'value' return by [dealing] is the return value of let function.
  ///
  /// for example,
  /// final a = "string".let((it) => "$it, 123");
  /// print(a); > string, 123
  dynamic let(dynamic Function(T it) dealing) {
    return dealing(this);
  }

  /// 'also' is good for performing some actions that take the context object as an argument.
  /// [it] is the object self.
  /// [dealing] is a function with an argument [it].
  ///
  /// for example,
  /// final a = [];
  /// a.also((it) => it.add("element"));
  /// print(a); > element
  T also(void Function(T it) dealing) {
    dealing(this);
    return this;
  }

  /// 'takeIf' returns object self if it matches the predicate. Otherwise, it returns null.
  ///
  /// for example,
  /// final a = [1];
  /// final result = a.takeIf((it) => it.isNotEmpty);
  /// print(result); > [1]
  T? takeIf(bool Function(T it) predicate) {
    return predicate(this) ? this : null;
  }

  /// 'takeUnless' returns object self if it doesn't matches the predicate. Otherwise, it returns null.
  ///
  /// for example,
  /// final a = [1];
  /// final result = a.takeUnless((it) => it.isEmpty);
  /// print(result); > [1]
  T? takeUnless(bool Function(T it) predicate) {
    return !predicate(this) ? this : null;
  }
}

/// 'run' is useful when your lambda contains both the object initialization and the computation of the return value.
/// [dealing] is a function with an argument [it] should return a 'value'.
/// the 'value' return by [dealing] is the return value of let function.
///
/// for example,
/// final a = run(() {
///   final b = ["123"];
///   final c = [567];
///   return []..addAll(b)..addAll(c);
/// });
/// print(a); > [123, 567]
dynamic run(dynamic Function() dealing) {
  return dealing();
}
