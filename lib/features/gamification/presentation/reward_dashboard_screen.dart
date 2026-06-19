import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/glass_container.dart';
import '../../../shared/widgets/kawaii_button.dart';

class RewardDashboardScreen extends StatelessWidget {
  const RewardDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cửa hàng Đổi thưởng')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBalanceHero(context),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Phần thưởng có sẵn',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontSize: 20.sp),
                ),
                TextButton(
                  onPressed: () => context.push('/lucky-spin'),
                  child: Row(
                    children: [
                      Icon(
                        Icons.casino_rounded,
                        color: AppColors.peach,
                        size: 20.sp,
                      ),
                      SizedBox(width: 4.w),
                      const Text(
                        'Vòng quay',
                        style: TextStyle(
                          color: AppColors.peach,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 16.w,
              crossAxisSpacing: 16.w,
              childAspectRatio: 0.8,
              children: [
                _buildRewardItem(
                  context,
                  'Mở khóa Tema Trái Đất',
                  500,
                  Icons.public_rounded,
                  AppColors.skyBlue,
                ),
                _buildRewardItem(
                  context,
                  'Mở khóa Mascot Mới',
                  1000,
                  Icons.pets_rounded,
                  AppColors.lavender,
                ),
                _buildRewardItem(
                  context,
                  'Giảm 20% gói Premium',
                  2000,
                  Icons.workspace_premium_rounded,
                  AppColors.warning,
                ),
                _buildRewardItem(
                  context,
                  'Avatar Độc Quyền',
                  300,
                  Icons.face_retouching_natural_rounded,
                  AppColors.peach,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBalanceHero(BuildContext context) {
    return GlassContainer(
      gradientColors: [AppColors.warning, AppColors.lemon],
      child: Center(
        child: Column(
          children: [
            Text(
              'Số dư Unicoin',
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.monetization_on_rounded,
                  color: Colors.white,
                  size: 40.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  '1.250',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            KawaiiButton(
              text: 'Lịch sử tích điểm',
              isPrimary: false,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardItem(
    BuildContext context,
    String title,
    int cost,
    IconData icon,
    Color color,
  ) {
    return GlassContainer(
      padding: EdgeInsets.all(12.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color, size: 30.sp),
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontSize: 14.sp),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.warning.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.monetization_on_rounded,
                  color: AppColors.warning,
                  size: 16.sp,
                ),
                SizedBox(width: 4.w),
                Text(
                  cost.toString(),
                  style: TextStyle(
                    color: AppColors.warning,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
