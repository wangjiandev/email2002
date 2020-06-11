import 'dart:async';

mixin Validation {
  static bool isEmail(String email) => email.contains('@');

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink) {
      if (isEmail(value)) {
        return sink.add(value);
      } else {
        return sink.addError("请输入正确的邮箱地址");
      }
    },
  );
}
