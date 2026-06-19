import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../shared/widgets/glass_container.dart';

class WalletsCarousel extends StatelessWidget {
  const WalletsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: 280.w,
            margin: EdgeInsets.only(right: 16.w),
            child: GlassContainer(
              gradientColors: index == 0
                  ? [
                      AppColors.lavender.withOpacity(0.9),
                      AppColors.peach.withOpacity(0.9),
                    ]
                  : null, // Use default glass for others
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.credit_card_rounded,
                        color: Colors.white,
                        size: 28.sp,
                      ),
                      Text(
                        index == 0 ? 'Ví chính' : 'Tiết kiệm',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Số dư',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12.sp,
                        ),
                      ),
                      Text(
                        index == 0 ? '12.500.000 ₫' : '12.000.000 ₫',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
