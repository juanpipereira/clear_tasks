import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<void> adaptivePush(Widget page) async {
    final route = Platform.isIOS
        ? CupertinoPageRoute(builder: (context) => page)
        : MaterialPageRoute(builder: (context) => page);
    await Navigator.of(this).push(route);
  }
}
