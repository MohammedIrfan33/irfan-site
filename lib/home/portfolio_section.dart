import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

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
                  childAspectRatio: 1.3,
                ),
                itemCount: 6, // Number of portfolio items
                itemBuilder: (context, index) {
                  return _PortfolioCard(
                    title: "Project ${index + 1}",
                    description:
                        "A short description of your project showcasing key features or technologies used.",
                    image: "assets/images/project${(index % 3) + 1}.jpg",
                    onTap: () {
                      print("Tapped on project ${index + 1}");
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
  final String description;
  final String image;
  final VoidCallback onTap;

  const _PortfolioCard({
    required this.title,
    required this.description,
    required this.image,
    required this.onTap,
  });

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
              child: Image.asset(
                image,
                height: 150.h,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 150.h,
                  color: Colors.grey[800],
                  child: const Center(
                    child: Icon(Icons.broken_image, color: Colors.white54),
                  ),
                ),
              ),
            ),

            // Text Details
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[400],
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      const Icon(Icons.link, color: Colors.white70, size: 18),
                      SizedBox(width: 6.w),
                      Text(
                        "View Project",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12.sp,
                          fontFamily: 'Manrope',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
