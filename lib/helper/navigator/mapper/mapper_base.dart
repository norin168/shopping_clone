import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' as m;
import 'package:w_navigator/helper/navigator/app_navigator/app_navigator.dart';
import 'package:w_navigator/helper/navigator/info/app_popup_info.dart';
import 'package:w_navigator/helper/navigator/info/app_route_info.dart';

abstract class BasePopupInfoMapper {
  m.Widget map(AppPopupInfo info, AppNavigator navigator);
}

abstract class BaseRouteInfoMapper {
  PageRouteInfo map(AppRouteInfo info);

  List<PageRouteInfo> mapList(List<AppRouteInfo> infos) {
    return infos.map(map).toList(growable: false);
  }
}
