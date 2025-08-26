import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/colors.dart';
import '../widgets/contact_button.dart';
import '../widgets/social_icon_button.dart';

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  Widget _buildNavItem(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w200,
          color: Colors.white,
          fontFamily: 'Manrope',
        ),
      ),
    );
  }

  Widget _buildDownloadButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.download, color: Colors.black, size: 18),
          SizedBox(width: 8),
          Text(
            "Resume",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.w),
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.w),
          border: Border.all(color: color.withOpacity(0.3), width: 1),
        ),
        child: Icon(icon, color: color, size: 24.sp),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Navigation Bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            decoration: BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo/Name
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    "IRFAN",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                // Navigation Items
                Row(
                  children: [
                    _buildNavItem("Work", () {}),
                    SizedBox(width: 20.w),
                    _buildNavItem("About", () {}),
                    SizedBox(width: 20.w),
                    _buildNavItem("Hire Me", () {}),
                    SizedBox(width: 20.w),
                    _buildDownloadButton(),
                  ],
                ),
              ],
            ),
          ),

          // Main Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 700.h,
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Hi, I am",
                                style: TextStyle(
                                  fontSize: 100.sp,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  height: 1,
                                ),
                              ),

                              Text(
                                "Mohammed Irfan.",
                                style: TextStyle(
                                  fontSize: 100.sp,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  height: 1,
                                ),
                              ),
                              SizedBox(height: 13.h),

                                                             Text(
                                 "Passionate Flutter & Laravel developer creating innovative mobile and web solutions \nwith a focus on user experience and clean code.",
                                 textAlign: TextAlign.start,
                                 style: TextStyle(
                                   fontSize: 18.sp,
                                   fontFamily: 'Manrope',
                                   fontWeight: FontWeight.w400,
                                   color: Color(0xffC7C7C7),
                                 ),
                               ),
                               SizedBox(height: 30.h),
                                                               Row(children: [
                                 ContactButton(
                                   onPressed: () {
                                     // Add your contact functionality here
                                     print('Contact button pressed!');
                                   },
                                 ),
                                 



                                                                                                        SocialIconButton(
                                     icon: Icons.link,
                                     onPressed: () {
                                       // Add LinkedIn functionality
                                       print('LinkedIn tapped!');
                                     },
                                     tooltip: 'LinkedIn',
                                   ),
                                   SizedBox(width: 20.w),
                                   SocialIconButton(
                                     icon: Icons.code,
                                     onPressed: () {
                                       // Add GitHub functionality
                                       print('GitHub tapped!');
                                     },
                                     tooltip: 'GitHub',
                                   ),
                                   SizedBox(width: 20.w),
                                   SocialIconButton(
                                     icon: Icons.center_focus_strong,
                                     onPressed: () {
                                       // Add center functionality
                                       print('Center tapped!');
                                     },
                                     tooltip: 'Center',
                                   ),
                                 ],),
                                SizedBox(width: 30.h),



                               
                                SizedBox(width: 13.h),
                              
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: Container(
                              width: 600.w,
                              height: 700.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25.r),
                                child: Image.asset(
                                  'assets/images/profile.jpeg',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: Colors.grey[300],
                                      child: Icon(
                                        Icons.person,
                                        size: 80.sp,
                                        color: Colors.grey[600],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
