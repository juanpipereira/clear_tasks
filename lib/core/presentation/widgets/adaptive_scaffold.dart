import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveScaffold extends StatelessWidget {
  const AdaptiveScaffold({
    super.key,
    required this.title,
    required this.body,
    this.androidAction,
    this.iosAction,
    this.appBarAction,
  });

  final String title;
  final Widget body;

  /// Corresponds to the [FloatingActionButton] in a [Scaffold]
  final Widget? androidAction;

  /// Corresponds to the trailing in a [CupertinoPageScaffold]
  final Widget? iosAction;

  /// This is the [CupertinoNavigationBar.leading] for ios and
  /// one [AppBar.actions] for android
  final Widget? appBarAction;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(title),
              trailing: iosAction,
              leading: appBarAction,
            ),
            child: SafeArea(
              bottom: false,
              child: Scaffold(body: body),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(title),
              centerTitle: true,
              actions: [
                if (appBarAction != null) appBarAction!,
              ],
            ),
            body: body,
            floatingActionButton: androidAction,
          );
  }
}
