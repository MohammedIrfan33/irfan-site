import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:irfan/utils/helper.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      color: const Color(0xff0a0a0a),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 60.h),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          // 🔹 Top Part: Name + Navigation + Social Links
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildLogo(),
                    SizedBox(height: 20.h),
                   
                    SizedBox(height: 20.h),
                    _buildSocialIcons(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLogo(),
             
                    _buildSocialIcons(),
                  ],
                ),

          SizedBox(height: 40.h),
          const Divider(color: Colors.white24, thickness: 1),
          SizedBox(height: 16.h),

          // 🔹 Bottom CopyRight
          Center(
            child: Text(
              "© 2025 Mohammed Irfan. All rights reserved.",
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 14.sp,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🧩 Logo / Name
  Widget _buildLogo() {
    return Text(
      "IRFAN",
      style: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        letterSpacing: 2,
      ),
    );
  }


  // 🌐 Social Media Icons
  Widget _buildSocialIcons() {
    final icons = [
      {"icon": FontAwesomeIcons.linkedin, "color": Colors.blueAccent, "link": "https://surl.lu/knwykh"},
      {"icon": FontAwesomeIcons.github, "color": Colors.white , "link": "https://github.com/MohammedIrfan33"},
      {"icon": FontAwesomeIcons.instagram, "color": Colors.pinkAccent, "link": "https://www.instagram.com/irfan__dev?igsh=MWJ1cnR5aHdqYzd2Ng=="},
      {"icon": FontAwesomeIcons.envelope, "color": Colors.tealAccent, "link" : "email" },
    ];

    return Wrap(
      spacing: 20.w,
      children: icons
          .map(
            (data) => InkWell(
              onTap: () {

                if (data["link"] == "email") {
                   
                } else {
                  openLink(link: data["link"] as String);

                  
                }
                
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: (data["color"] as Color).withOpacity(0.4)),
                ),
                child: Icon(
                  data["icon"] as IconData,
                  color: data["color"] as Color,
                  size: 22.sp,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
