import 'package:flutter/material.dart';
import 'package:folio/responsive/responsive.dart';
import 'package:folio/sections/home/home_desktop.dart';
// import 'package:folio/sections/home/home_mobile.dart';
// import 'package:folio/sections/home/home_tab.dart';

enum device { isMobile, istablate, isDesktop }

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: HomeDesktop(
        type: device.isMobile,
      ),
      tablet: HomeDesktop(
        type: device.istablate,
      ),
      desktop: HomeDesktop(
        type: device.isDesktop,
      ),
    );
  }
}
