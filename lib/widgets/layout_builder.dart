import 'package:flutter/material.dart';
import 'package:my_web_app/screens/desktop/desktop_home_screen.dart';
import 'package:my_web_app/screens/mobile/mobile_home_screen.dart';
import 'package:my_web_app/screens/tablet/tablet_home_screen.dart';

class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth <= 786){
        return MobileHomeScreen();
      }else if(constraints.minWidth > 500 && constraints.maxWidth <= 1180){
        return TabletHomeScreen();
      }else {
        return DesktopHomeScreen();
      }

      
    },);
  }
}