## Installing

```yaml
dependencies:
  result_option:
```

```dart
import 'package:result_option/result_option.dart';
```

## Usage

- **Result**

  It represent the result of an operation. 

  This is useful for API designs that require explicit error handling.

  - **Basic**

    ```dart
    final result = fetchCompanies(startsWithG: true);
    
    result.match(
      ok: (c) => print(c),
      err: (e) => print(e),
    );
    ```

  - **Construct**

    ```dart
    Result<int, String> value = ok(calculate('3+5/2'));
    Result<int, String> failed = err('Calculation failed');
    ```
    
  - **Handling Multiple Results**

    ```dart
    Result<bool, Failure> r1 = doSomething1();
    Result<bool, Failure> r2 = doSomething2();
    Result<bool, Failure> r3 = doSomething3();
    
    if ([r1, r2, r3].isAllOk()) {
    	return 'success';
    } else {
    	rollback();
    	return 'failed';
    }
    ```

- **Option**

  It is used when there is a result value or there is no result. 

  (For the null-safety version of Dart, use nullable types whenever possible.)

  - **Basic**

    ```dart
    Option<SomeObj> maybeObj = SomeObj.fromJson(json);
    
    SomeObj obj = maybeObj.unwrap() ?? defaultObj;
    SomeObj obj = maybeObj.unwrapOr(orElse: () => defaultObj);
    ```

  - **Construct**

    ```
    Option<int> value = some(1);
    Option<int> nothing = none();
    ```

- **Either**

  - **Construct**

    ```dart
    Either<int, double> l = left(100);
    Either<int, double> r = right(3.14);
    ```

    

## Features and bugs

[here](https://github.com/pubmskim/result_option/issues)

