// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'app_popup_info.freezed.dart';

// @freezed
// class AppPopupInfo1 with _$AppPopupInfo {
//   const factory AppPopupInfo.errorDialog() = _ErrorDialog;
//   const factory AppPopupInfo.bottomSheetDetail() = _BottomSheetDetail;
// }

// dialog, bottom sheet
sealed class AppPopupInfo {
  const AppPopupInfo._();

  const factory AppPopupInfo.errorDialog() = ErrorDialogInfo;
  const factory AppPopupInfo.bottomSheetDetail() = BottomSheetDetailInfo;
}

class ErrorDialogInfo extends AppPopupInfo {
  const ErrorDialogInfo() : super._();
}

class BottomSheetDetailInfo extends AppPopupInfo {
  const BottomSheetDetailInfo() : super._();
}
