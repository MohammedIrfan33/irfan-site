
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants/colors.dart';
import 'home/portfolio_home.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Evaluate the current constraints to provide an appropriate baseline
        // so that .sp and .w don't shrink too much on mobile.
        final Size designSize;
        if (constraints.maxWidth < 600) {
          designSize = const Size(390, 844); // Mobile baseline
        } else if (constraints.maxWidth < 1024) {
          designSize = const Size(834, 1194); // Tablet baseline
        } else {
          designSize = const Size(1440, 900); // Desktop baseline
        }

        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          builder: (context, child) {
            return MaterialApp(
              title: 'My Portfolio',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'BebasNeue',
                scaffoldBackgroundColor: AppColors.backgroundColor,
                primaryColor: AppColors.primaryColor,
              ),
              home: const PortfolioHome(),
            );
          },
        );
      },
    );
  }
}


