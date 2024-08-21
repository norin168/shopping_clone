import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:w_navigator/helper/navigator/app_navigator/app_navigator.dart';
import 'package:w_navigator/helper/navigator/info/app_popup_info.dart';
import 'package:w_navigator/helper/navigator/mapper/mapper_base.dart';
import 'package:w_navigator/helper/widgets/common_dialog.dart';

@Singleton(as: BasePopupInfoMapper)
class AppPopupInfoMapper extends BasePopupInfoMapper {
  @override
  Widget map(AppPopupInfo info, AppNavigator navigator) {
    switch (info) {
      case ErrorDialogInfo():
        return const CommonDialog(
          title: 'Error',
          message: 'Error Dialog Appear',
        );

      case BottomSheetDetailInfo _:
        {
          return const CommonDialog(
            title: 'Bottom sheet',
            message: 'Common Bottom Sheet not support yet.',
          );
        }
    }
  }
}
