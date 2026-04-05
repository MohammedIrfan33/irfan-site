import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:irfan/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:irfan/constants/projects.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveLayout.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 60.h),
      alignment: Alignment.center,
      color: const Color(0xff0D0D0D),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "My Works",
            style: TextStyle(
              fontSize: isMobile ? 28.sp : 42.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            "A selection of projects that showcase my development and design skills.",
            style: TextStyle(
              fontSize: isMobile ? 14.sp : 16.sp,
              color: Colors.grey[400],
              fontFamily: 'Manrope',
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40.h),

          // Portfolio Grid
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 1;
              if (constraints.maxWidth >= 1024) {
                crossAxisCount = 3;
              } else if (constraints.maxWidth >= 600) {
                crossAxisCount = 2;
              }

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20.w,
                  mainAxisSpacing: 20.h,
                  childAspectRatio: isMobile ? 1.0 : 1.3,
                ),
                itemCount: myProjects.length,
                itemBuilder: (context, index) {
                  final project = myProjects[index];
                  return _PortfolioCard(
                    title: project.title,
                    image: project.imagePath,
                    appIcon: project.appIcon,
                    isContribution: project.isContribution,
                    stateManagement: project.stateManagement,
                    technologies: project.technologies,
                    playStoreUrl: project.playStoreUrl,
                    appStoreUrl: project.appStoreUrl,
                    githubUrl: project.githubUrl,
                    onTap: () {
                      print("Tapped on ${project.title}");
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _PortfolioCard extends StatelessWidget {
  final String title;
  final String image;
  final String? appIcon;
  final bool isContribution;
  final String? stateManagement;
  final String? technologies;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? githubUrl;
  final VoidCallback onTap;

  const _PortfolioCard({
    required this.title,
    required this.image,
    this.appIcon,
    this.isContribution = false,
    this.stateManagement,
    this.technologies,
    this.playStoreUrl,
    this.appStoreUrl,
    this.githubUrl,
    required this.onTap,
  });

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15.r),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff1A1A1A),
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Project Image
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
              child: image.startsWith('http')
                  ? Image.network(
                      image,
                      height: 250.h,
                      width: double.infinity,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 220.h,
                        color: Colors.grey[800],
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                    )
                  : Image.asset(
                      image,
                      height: 220.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 220.h,
                        color: Colors.grey[800],
                        child: const Center(
                          child: Icon(
                            Icons.broken_image,
                            color: Colors.white54,
                          ),
                        ),
                      ),
                    ),
            ),

            // Text Details
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(12.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Manrope',
                              ),
                            ),
                            if (isContribution)
                              Padding(
                                padding: EdgeInsets.only(top: 6.h),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(4.r),
                                    border: Border.all(color: Colors.green),
                                  ),
                                  child: Text("Contributor", style: TextStyle(color: Colors.greenAccent, fontSize: 10.sp, fontFamily: 'Manrope')),
                                ),
                              ),
                            SizedBox(height: 6.h),
                            if (technologies != null) ...[
                              SizedBox(height: 8.h),
                              Text(
                                "Tech: $technologies",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontFamily: 'Manrope',
                                ),
                              ),
                            ],
                            if (stateManagement != null) ...[
                              SizedBox(height: 4.h),
                              Text(
                                "State Management: $stateManagement",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontFamily: 'Manrope',
                                ),
                              ),
                            ],
                            SizedBox(height: 10.h),

                            Wrap(
                              spacing: 12.w,
                              runSpacing: 8.h,
                              children: [
                                if (playStoreUrl != null)
                                  InkWell(
                                    onTap: () => _launchURL(playStoreUrl!),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.shop,
                                          color: Colors.white70,
                                          size: 18,
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          "Play Store",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12.sp,
                                            fontFamily: 'Manrope',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (appStoreUrl != null)
                                  InkWell(
                                    onTap: () => _launchURL(appStoreUrl!),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.apple,
                                          color: Colors.white70,
                                          size: 18,
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          "App Store",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12.sp,
                                            fontFamily: 'Manrope',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (githubUrl != null)
                                  InkWell(
                                    onTap: () => _launchURL(githubUrl!),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(
                                          Icons.code,
                                          color: Colors.white70,
                                          size: 18,
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(
                                          "GitHub",
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12.sp,
                                            fontFamily: 'Manrope',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      if (appIcon != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: appIcon!.startsWith('http')
                              ? Image.network(
                                  appIcon!,
                                  width: 40.w,
                                  height: 40.w,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                        width: 40.w,
                                        height: 40.w,
                                        color: Colors.grey[800],
                                      ),
                                )
                              : Image.asset(
                                  appIcon!,
                                  width: 40.w,
                                  height: 40.w,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                        width: 40.w,
                                        height: 40.w,
                                        color: Colors.grey[800],
                                      ),
                                ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
