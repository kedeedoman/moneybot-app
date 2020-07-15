import 'package:flutter/material.dart';
import 'package:moneybot/utils/network_manager.dart';
import 'package:moneybot/utils/routes.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    initNetworkChangeListener();
  }

  initNetworkChangeListener() {
    NetworkManager.getInstance().connectionChangeStream.listen((isConnected) {
      if (!isConnected)
        RouteManager.navigateTo(context, ScreenType.NO_INTERNET);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
