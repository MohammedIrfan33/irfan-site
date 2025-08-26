import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Container(
      width: size.w,
      height: size.w,
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
            size: 24.sp,
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
