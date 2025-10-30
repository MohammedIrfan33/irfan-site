import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;
    final bool isTablet = MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1024;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 80.h),
      color: const Color(0xff111111),
      alignment: Alignment.center,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildTextContent(isMobile),
                  SizedBox(height: 30.h),
                  _buildProfileImage(),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(flex: 5, child: _buildTextContent(isMobile)),
                  SizedBox(width: 40.w),
                  Expanded(flex: 4, child: _buildProfileImage()),
                ],
              ),
      ),
    );
  }

  // 🧠 Text Content (About info)
  Widget _buildTextContent(bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "About Me",
          style: TextStyle(
            fontSize: isMobile ? 28.sp : 42.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        SizedBox(height: 5.h),
        Text(
          "Who I am",
          style: TextStyle(
            fontSize: isMobile ? 16.sp : 20.sp,
            color: Colors.tealAccent,
            fontWeight: FontWeight.w500,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        SizedBox(height: 20.h),
        Text(
          "I’m Mohammed Irfan, a passionate Flutter and Laravel developer with a strong eye for detail and a love for building functional, elegant, and scalable applications. "
          "Over the past few years, I’ve worked on mobile and web projects focusing on clean architecture, modern UI/UX, and performance optimization.\n"
          "When I’m not coding, I enjoy exploring new technologies, mentoring students, and continuously improving my problem-solving and design thinking skills.",
          style: TextStyle(
            fontSize: isMobile ? 14.sp : 18.sp,
            color: Colors.grey[400],
            fontFamily: 'Manrope',
            
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        SizedBox(height: 30.h),

        // Skill Highlights
        Wrap(
          spacing: 20.w,
          runSpacing: 10.h,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: const [
            _SkillChip(label: "Flutter"),
            _SkillChip(label: "Laravel"),
            _SkillChip(label: "Firebase"),
            _SkillChip(label: "REST API"),
            _SkillChip(label: "UI/UX"),
            _SkillChip(label: "Provider / BLoC"),
          ],
        ),
      ],
    );
  }

  // 🧍 Profile Image Section
Widget _buildProfileImage() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(30.r),
    child: AspectRatio(
      aspectRatio: 1.04, // square image
      child: Image.asset(
        "assets/images/irfan.jpg",
        fit: BoxFit.cover, // maintains aspect ratio, fills box
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey[800],
          child: const Center(
            child: Icon(Icons.person, color: Colors.white54, size: 80),
          ),
        ),
      ),
    ),
  );
}

}

class _SkillChip extends StatelessWidget {
  final String label;
  const _SkillChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.tealAccent.withOpacity(0.5)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: Colors.tealAccent,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
