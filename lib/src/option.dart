import 'package:to_string_pretty/to_string_pretty.dart';

class Option<V> {
  final V? _value;

  bool get isNone => _value == null;
  bool get isSome => _value != null;

  const Option.some(V value) : _value = value;
  const Option.none() : _value = null;

  V? unwrap() => _value;

  V unwrapOrElse({
    required V Function() orElse,
  }) {
    return _value ?? orElse();
  }

  T match<T>({
    required T Function(V) some,
    required T Function() none,
  }) {
    return isSome ? some(_value!) : none();
  }

  @override
  String toString() => toStringPretty(this, {
        if (isSome) 'value': _value! else 'value': 'none',
      });
}

Option<V> some<V>(V value) => Option<V>.some(value);

Option<V> none<V>() => Option<V>.none();
