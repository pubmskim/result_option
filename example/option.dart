import 'package:either/either.dart';

class JsonSerdeable {
  final String value1;
  final int value2;

  const JsonSerdeable({required this.value1, required this.value2});

  static Result<JsonSerdeable, InvalidJsonkey> fromJson(
      Map<String, dynamic> json) {
    try {
      final maybeThis = JsonSerdeable(
        value1: json.get<String>('value1').unwrapOrThrow(),
        value2: json.get<int>('value2').unwrapOrThrow(),
      );
      return ok(maybeThis);
    } on InvalidJsonkey catch (e) {
      return err(e);
    }
  }
}

void main() {
  final json = {'value1': 1, 'value2': 2};

  final result = JsonSerdeable.fromJson(json);
  result.match(
    ok: (v) => print(v),
    err: (err) => print(err),
  );
}
