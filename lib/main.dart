
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
    return ScreenUtilInit(
      designSize: const Size(1920, 951), // iPhone X design size
      minTextAdapt: true,
      splitScreenMode: true,
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
  }
}


