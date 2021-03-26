import 'option.dart';
import 'package:to_string_pretty/to_string_pretty.dart';

class Either<L, R> {
  final L? _left;
  final R? _right;

  Either.left(L value)
      : _left = value,
        _right = null;

  Either.right(R value)
      : _left = null,
        _right = value;

  bool get isLeft => _right == null;

  bool get isRight => !isLeft;

  Option<V> ifLeft<V>(V Function(L) fn) {
    return match(
      left: (l) => some(fn(l)),
      right: (_) => none(),
    );
  }

  Option<V> ifRight<V>(V Function(R) fn) {
    return match(
      left: (_) => none(),
      right: (r) => some(fn(r)),
    );
  }

  V match<V>({
    required V Function(L) left,
    required V Function(R) right,
  }) {
    if (isLeft) {
      return left(_left!);
    }
    return right(_right!);
  }

  @override
  String toString() => toStringPretty(this, {
        if (isLeft) 'left': _left! else 'right': _right!,
      });
}

Either<L, R> left<L, R>(L value) => Either.left(value);
Either<L, R> right<L, R>(R value) => Either.right(value);
