The types that represent the result of the operation. this is useful when designing API requires that an user should handle errors explicitly. 

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

- **Option**

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

    

## Features and bugs

