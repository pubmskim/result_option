import 'package:to_string_pretty/to_string_pretty.dart';

import 'option.dart';

// T = Type
// F = Failure
class Result<T, F> {
  final Option<T> _ok;
  final Option<F> _err;

  Result.ok(T value)
      : _ok = some(value),
        _err = none();

  Result.err(F error)
      : _ok = none(),
        _err = some(error);

  bool get isOk => _ok.isSome;

  bool get isErr => _err.isSome;

  T? unwrap() => _ok.unwrap();

  T unwrapOrThrow() {
    if (isOk) return _ok.unwrap()!;
    throw _err.unwrap()!;
  }

  T unwrapOr(T Function() orElse) {
    return _ok.match(some: (v) => v, none: orElse);
  }

  F? unwrapErr() => _err.unwrap();

  F unwrapErrOrThrow() {
    if (isErr) return _err.unwrap()!;
    throw _ok.unwrap()!;
  }

  F unwrapErrOr(F Function() orElse) {
    return _err.match(some: (e) => e, none: orElse);
  }

  Option<R> ifOk<R>(R Function(T) fn) {
    return match(
      ok: (ok) => some(fn(ok)),
      err: (_) => none(),
    );
  }

  Option<R> ifErr<R>(R Function(F) fn) {
    return match(
      ok: (_) => none(),
      err: (e) => some(fn(e)),
    );
  }

  R match<R>({
    required R Function(T) ok,
    required R Function(F) err,
  }) {
    if (isOk) {
      return ok(_ok.unwrap()!);
    }
    return err(_err.unwrap()!);
  }

  @override
  String toString() => toStringPretty(this, {
        if (isOk) 'ok': unwrap()! else 'err': unwrapErr()!,
      });
}

Result<T, F> ok<T, F>(T value) => Result<T, F>.ok(value);

Result<T, F> err<T, F>(F error) => Result<T, F>.err(error);
