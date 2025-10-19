import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CameraPlaceholder extends StatelessWidget {
  const CameraPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: 0,
      bottom: 70.h,
      child: Center(
        child: Icon(Icons.camera_alt, size: 100.sp, color: Colors.white24),
      ),
    );
  }
}
