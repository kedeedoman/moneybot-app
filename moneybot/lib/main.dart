import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneybot/src/resources/colors.dart';
import 'package:moneybot/src/resources/strings.dart';
import 'package:moneybot/utils/network_manager.dart';
import 'package:moneybot/utils/routes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(MoneybotApp());
}

class MoneybotApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MoneybotAppState();
  }
}

class _MoneybotAppState extends State<MoneybotApp> {
  @override
  void initState() {
    super.initState();
    NetworkManager networkManager = NetworkManager.getInstance();
    networkManager.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteManager.generateRoute,
      debugShowCheckedModeBanner: true,
      title: AppString.app_name,
      theme: _getAppTheme(context),
      initialRoute: ScreenType.SPLASH.name,
    );
  }
}

_getAppTheme(BuildContext context) {
  return ThemeData(
    fontFamily: AppString.font_name,
    primaryColor: AppColor.PRIMARY.color,
    primaryColorDark: AppColor.PRIMARY_DARK.color,
    accentColor: AppColor.ACCENT.color,
    primaryIconTheme:
        Theme.of(context).accentIconTheme.copyWith(color: AppColor.WHITE.color),
    accentIconTheme:
        Theme.of(context).accentIconTheme.copyWith(color: AppColor.WHITE.color),
    primaryTextTheme: TextTheme(headline6: TextStyle(color: Colors.white)),
  );
}
