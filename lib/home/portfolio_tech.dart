import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:irfan/utils/responsive.dart';

class TechSection extends StatelessWidget {
  const TechSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      color: const Color(0xff0e0e0e),
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 100.h),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Technologies I Use",
              style: TextStyle(
                fontSize: isMobile ? 32.sp : 46.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.1,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            Text(
              "The tools and technologies that power my development journey.",
              style: TextStyle(
                fontSize: isMobile ? 16.sp : 18.sp,
                color: Colors.grey[400],
                height: 1.5,
                fontFamily: 'Manrope',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 60.h),

            // Tech Grid
            Wrap(
              spacing: 40.w,
              runSpacing: 40.h,
              alignment: WrapAlignment.center,
              children: const [
                _TechIcon(icon: FontAwesomeIcons.flutter, label: "Flutter", color: Colors.lightBlueAccent),
                _TechIcon(icon: FontAwesomeIcons.dartLang, label: "Dart", color: Colors.blueAccent),
                _TechIcon(icon: FontAwesomeIcons.laravel, label: "Laravel", color: Colors.redAccent),
                _TechIcon(icon: FontAwesomeIcons.database, label: "MySQL", color: Colors.orangeAccent),
                _TechIcon(icon: FontAwesomeIcons.fire, label: "Firebase", color: Colors.amberAccent),
                _TechIcon(icon: FontAwesomeIcons.gitAlt, label: "Git", color: Colors.deepOrangeAccent),
                _TechIcon(icon: FontAwesomeIcons.github, label: "GitHub", color: Colors.white),
                _TechIcon(icon: FontAwesomeIcons.html5, label: "HTML", color: Colors.orange),
                _TechIcon(icon: FontAwesomeIcons.css3Alt, label: "CSS", color: Colors.blue),
                _TechIcon(icon: FontAwesomeIcons.js, label: "JavaScript", color: Colors.yellowAccent),
                
                _TechIcon(icon: FontAwesomeIcons.nodeJs, label: "Node.js", color: Colors.greenAccent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TechIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _TechIcon({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 90.w,
          height: 90.w,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: color.withOpacity(0.7), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Icon(icon, color: color, size: 42.sp),
        ),
        SizedBox(height: 10.h),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3,
            fontFamily: 'Manrope',
          ),
        ),
      ],
    );
  }
}
