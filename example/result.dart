import 'package:either/either.dart';
import 'package:to_string_pretty/to_string_pretty.dart';

Result<List<String>, String> fetchCompanies({required bool startsWithG}) {
  if (startsWithG) {
    return ok(['Google', 'Gillette']);
  }
  return err('Some Failed');
}

void main() {
  final result = fetchCompanies(startsWithG: true);

  // match
  result.match(
    ok: (c) => print(toStringPretty(c)),
    err: (e) => print(e),
  );

  final companies = result.unwrap() ?? [];
  final comapnies2 = result.unwrapOr(() => []);

  final error = result.unwrapErr() ?? 'default message';
  final error2 = result.unwrapErrOr(() => 'default message');
}
