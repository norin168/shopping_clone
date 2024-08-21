import 'dart:io';

import 'package:flutter/material.dart';

enum LoadingType { ios, android, adaptive }

class CommonLoading extends StatelessWidget {
  const CommonLoading({
    this.commonLoadingType = LoadingType.adaptive,
    super.key,
  });

  const CommonLoading.android({Key? key})
      : this(
          commonLoadingType: LoadingType.android,
          key: key,
        );

  const CommonLoading.ios({Key? key})
      : this(
          commonLoadingType: LoadingType.ios,
          key: key,
        );

  const CommonLoading.adaptive({Key? key})
      : this(
          commonLoadingType: LoadingType.adaptive,
          key: key,
        );

  final LoadingType commonLoadingType;

  @override
  Widget build(BuildContext context) {
    switch (commonLoadingType) {
      case LoadingType.android:
        return _buildAndroidDialog();
      case LoadingType.ios:
        return _buildIosDialog();
      case LoadingType.adaptive:
        return Platform.isIOS ? _buildIosDialog() : _buildAndroidDialog();
    }
  }

  Widget _buildAndroidDialog() {
    return Container(
      color: Colors.blueGrey.withOpacity(.25),
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
        ),
      ),
    );
  }

  Widget _buildIosDialog() {
    return Container(
      color: Colors.blueGrey.withOpacity(.25),
      child: const Center(
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 2.5,
        ),
      ),
    );
  }
}
