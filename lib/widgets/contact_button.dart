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
    return ElevatedButton(
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
          horizontal: 36.w,
          vertical: 26.h,
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
              fontSize: 16.sp,
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 15.w),
          Icon(
            Icons.circle,
            size: 12.sp,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
