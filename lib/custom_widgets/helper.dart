

import 'package:flutter/material.dart';

class UIHelper {
  static void looseFocus() {
    FocusManager.instance.rootScope.requestFocus(FocusNode());
  }
}

//some helping extension
extension DateFormat on DateTime? {
  String get formattedData {
    if (this == null) {
      return '';
    } else {
      DateTime d = this!;
      return '${d.month}-${d.day}-${d.year}';
    }
  }
}