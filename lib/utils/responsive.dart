import 'package:flutter/material.dart';

class ResponsiveLayout {
  // Common breakpoints
  static const double mobileLimit = 600;
  static const double tabletLimit = 1024;
  static const double desktopLimit = 1600;

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < mobileLimit;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileLimit &&
      MediaQuery.of(context).size.width < tabletLimit;

  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= tabletLimit;

  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= desktopLimit;
}
