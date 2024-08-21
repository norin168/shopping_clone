import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog({
    this.commonPopupType = PopupType.adaptive,
    this.actions = const <Widget>[],
    this.title,
    this.message,
    super.key,
  });

  const CommonDialog.android({
    List<Widget> actions = const <Widget>[],
    String? title,
    String? message,
    Key? key,
  }) : this(
          commonPopupType: PopupType.android,
          actions: actions,
          title: title,
          message: message,
          key: key,
        );

  const CommonDialog.ios({
    List<Widget> actions = const <Widget>[],
    String? title,
    String? message,
    Key? key,
  }) : this(
          commonPopupType: PopupType.ios,
          actions: actions,
          title: title,
          message: message,
          key: key,
        );

  const CommonDialog.adaptive({
    List<Widget> actions = const <Widget>[],
    String? title,
    String? message,
    Key? key,
  }) : this(
          commonPopupType: PopupType.adaptive,
          actions: actions,
          title: title,
          message: message,
          key: key,
        );

  final PopupType commonPopupType;
  final List<Widget> actions;
  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    switch (commonPopupType) {
      case PopupType.android:
        return _buildAndroidDialog();
      case PopupType.ios:
        return _buildIosDialog();
      case PopupType.adaptive:
        return Platform.isIOS ? _buildIosDialog() : _buildAndroidDialog();
    }
  }

  Widget _buildAndroidDialog() {
    return AlertDialog(
      actions: actions,
      title: title != null
          ? Text(
              title ?? '',
            )
          : null,
      content: message != null
          ? Text(
              message ?? '',
            )
          : null,
    );
  }

  Widget _buildIosDialog() {
    return CupertinoAlertDialog(
      actions: actions,
      title: title != null
          ? Text(
              title ?? '',
            )
          : null,
      content: message != null
          ? Text(
              message ?? '',
            )
          : null,
    );
  }
}

enum PopupType { ios, android, adaptive }
