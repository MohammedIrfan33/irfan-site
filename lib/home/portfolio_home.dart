import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:irfan/home/portfolio_about.dart';
import 'package:irfan/home/portfolio_footer.dart';
import 'package:irfan/home/portfolio_section.dart';
import 'package:irfan/home/portfolio_tech.dart';
import 'package:irfan/utils/helper.dart';
import '../widgets/contact_button.dart';
import '../widgets/social_icon_button.dart';

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({super.key});

  Widget _buildNavItem(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
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
        children: [
          Icon(Icons.download, color: Colors.black, size: 18.sp),
          SizedBox(width: 8.w),
          Text(
            "Resume",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              fontFamily: 'Manrope',
            ),
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
    final Size screenSize = MediaQuery.of(context).size;
    final bool isMobile = screenSize.width < 600;
    final bool isTablet = screenSize.width >= 600 && screenSize.width < 1024;
    final bool isDesktop = screenSize.width >= 1024;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: openWhatsApp,
        shape: const CircleBorder(),
        child: const Icon(FontAwesomeIcons.whatsapp, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: isMobile
          ? AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.white),
              title: Text(
                "IRFAN",
                style: TextStyle(
                  fontSize: isMobile?  80.sp  : 30.sp, // Increased for better readability
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Colors.white,
                ),
              ),
            )
          : null,
      drawer: isMobile
          ? Drawer(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'MENU',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    ListTile(title: const Text('Work'), onTap: () => Navigator.pop(context)),
                    ListTile(title: const Text('About'), onTap: () => Navigator.pop(context)),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: _buildDownloadButton(),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          _buildSocialIcon(Icons.link, Colors.blue, () {
                            openLink(link: 'https://surl.lu/knwykh');
                          }),
                          SizedBox(width: 12.w),
                          _buildSocialIcon(Icons.code, Colors.white, () {}),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          : null,
      body: Column(
        children: [
          if (!isMobile)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo/Name
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Text(
                      "IRFAN",
                      style: TextStyle(
                        fontSize: isMobile ? 36.sp : (isTablet ? 30.sp : 26.sp),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
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
                    height: isDesktop ? 700.h : (isTablet ? 650.h : null),
                    padding: EdgeInsets.symmetric(horizontal: isDesktop ? 50.w : 20.w, vertical: isMobile ? 24.h : 0),
                    alignment: Alignment.center,
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: isMobile
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _HeroTexts(isMobile: true),
                              SizedBox(height: 24.h),
                              _HeroImage(isMobile: true),
                            ],
                          )
                        : Row(
                            children: [
                              Expanded(child: _HeroTexts(isMobile: false)),
                              Expanded(child: _HeroImage(isMobile: false)),
                            ],
                          ),
                  ),
                  PortfolioSection(),
                  AboutSection(),
                  TechSection(),
                  FooterSection()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroTexts extends StatelessWidget {
  final bool isMobile;
  const _HeroTexts({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1024;

    // ✅ Improved readability
    final double titleSize = 100.sp;
    final double subtitleSize = isMobile ? 45.sp : (isTablet ? 40.sp : 20.sp);

    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Hi, I am",
          style: TextStyle(
            fontSize: titleSize,
            color: Colors.white,
            letterSpacing: 2,
            height: 1.2, // Better line spacing
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        Text(
          "Mohammed Irfan.",
          style: TextStyle(
            fontSize: titleSize,
            color: Colors.white,
            letterSpacing: 2,
            height: 1.2,
            fontWeight: FontWeight.bold,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ),
        SizedBox(height: 16.h),
        Text(
          "Passionate Flutter & Laravel developer creating innovative mobile and web solutions\nwith a focus on user experience and clean code.",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: subtitleSize,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w400,
            height: 1.4,
            color: const Color(0xffC7C7C7),
          ),
        ),
        SizedBox(height: 30.h),
        Wrap(
          spacing: 16.w,
          runSpacing: 12.h,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
             SizedBox(
      width: isMobile ? double.infinity : null, 
      child: ContactButton(onPressed: openWhatsApp),
    ),
            SocialIconButton(
              icon: Icons.link,
              onPressed: () => openLink(link: 'https://surl.lu/knwykh'),
              tooltip: 'LinkedIn',
            ),
            SocialIconButton(
              icon: Icons.code,
              onPressed: () => openLink(link: 'https://github.com/MohammedIrfan33'),
              tooltip: 'GitHub',
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroImage extends StatelessWidget {
  final bool isMobile;
  const _HeroImage({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1024;
    final double imageWidth = isMobile ? double.infinity : (isTablet ? 480.w : 600.w);
    final double imageHeight = isMobile ? 420.h : (isTablet ? 560.h : 700.h);

    return Container(
      alignment: Alignment.center,
      child: Container(
        width: imageWidth,
        height: imageHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.r),
          child: Image.asset(
            'assets/images/profile.jpeg',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.grey[300],
              child: Icon(Icons.person, size: 80.sp, color: Colors.grey[600]),
            ),
          ),
        ),
      ),
    );
  }
}
