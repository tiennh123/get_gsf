import 'dart:async';

import 'package:flutter/services.dart';

class GetGsf {
  static const MethodChannel _channel = const MethodChannel('get_gsf');

  static Future<String> get gsfId async {
    final String gsf = await _channel.invokeMethod('getGsf');
    return gsf;
  }
}
