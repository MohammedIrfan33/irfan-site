import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactButton extends StatelessWidget {
  final VoidCallback onPressed;
  
  const ContactButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isNarrow = constraints.maxWidth < 600;
        // Reduce only internal paddings and label/icon sizes on mobile
        final double horizontalPadding = isNarrow ? 16.w : 36.w;
        final double verticalPadding = isNarrow ? 14.h : 26.h;
        final double labelSize = isNarrow ? 14.sp : 16.sp;
        final double iconSize = isNarrow ? 10.sp : 12.sp;

        final Widget button = ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFD3E97A),
            foregroundColor: Colors.black,
            elevation: 0,
            shadowColor: const Color(0xFFD3E97A).withOpacity(0.4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: verticalPadding,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'CONTACT ME',
                style: TextStyle(
                  fontSize: labelSize,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 15.w),
              Icon(
                Icons.circle,
                size: iconSize,
                color: Colors.black,
              ),
            ],
          ),
        );

        // Keep natural width; do not force full width on mobile
        return button;
      },
    );
  }
}
