import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:irfan/utils/responsive.dart';

class SocialIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  
  const SocialIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip = '',
    this.size = 56,
    this.backgroundColor = const Color(0xFF222222),
    this.iconColor = const Color(0xFFD3E97A),
  });

  @override
  Widget build(BuildContext context) {
    final bool isNarrow = ResponsiveLayout.isMobile(context);
    final double computedSize = isNarrow ? (size * 0.8) : size;
    final double iconSize = isNarrow ? 20.sp : 24.sp;

    return Container(
      width: computedSize.w,
      height: computedSize.w,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
          tooltip: tooltip,
          padding: EdgeInsets.zero,
          style: IconButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
