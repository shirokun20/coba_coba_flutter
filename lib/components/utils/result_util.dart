class ResultUtil<T> {
  ResultUtil();

  factory ResultUtil.ok(T data, String msg) = Ok<T>;
  factory ResultUtil.error(int code, String msg) = Error<T>;
}

class Ok<T> extends ResultUtil<T> {
  final T response;
  final String message;

  Ok(this.response, this.message);
}

class Error<T> extends ResultUtil<T> {
  final int code;
  final String message;

  Error(this.code, this.message);
}
