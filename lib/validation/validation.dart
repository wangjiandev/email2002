import 'dart:async';

mixin Validation {
  static bool isEmail(String email) => email.contains('@');

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink) {
      if (isEmail(value)) {
        sink.add(value);
      } else {
        sink.addError("请输入正确的邮箱地址");
      }
    },
  );

  final validateSubject = StreamTransformer<String, String>.fromHandlers(
    handleData: (value, sink) {
      int length = value.length;
      if (length == 0) {
        sink.addError("请输入主题内容");
      } else if (length < 4) {
        sink.addError("主题内容不少于4个字符");
      } else {
        sink.add(value);
      }
    },
  );
}
