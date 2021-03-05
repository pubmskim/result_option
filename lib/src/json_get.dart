import 'package:to_string_pretty/to_string_pretty.dart';

import './result.dart';

extension JsonExt on Map<String, dynamic> {
  Result<T, InvalidJsonkey> get<T extends Object>(String key) {
    final value = this[key];
    if (value != null && value is T) {
      return ok(value);
    }
    return err(InvalidJsonkey(failedValue: MapEntry(key, value), type: T));
  }
}

class InvalidJsonkey {
  final MapEntry<String, dynamic> failedValue;
  final Type type;

  @override
  String get reason =>
      "The json does not contain '${failedValue.key}' -> '$type'";

  const InvalidJsonkey({required this.failedValue, required this.type});

  @override
  String toString() {
    final context = failedValue.value ?? 'null';
    return toStringPretty(this, {
      'reason': reason,
      'failedValue': "'${failedValue.key}' -> ${context.runtimeType}($context)",
    });
  }
}
