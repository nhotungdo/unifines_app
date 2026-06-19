import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/glass_container.dart';

class SavingsGoalsScreen extends StatelessWidget {
  const SavingsGoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mục tiêu Tiết kiệm'),
        actions: [
          IconButton(icon: const Icon(Icons.add_rounded), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            _buildSavingJar(
              context,
              title: 'Mua MacBook Pro',
              saved: 15000000,
              target: 45000000,
              icon: Icons.laptop_mac_rounded,
              color: AppColors.lavender,
            ),
            SizedBox(height: 20.h),
            _buildSavingJar(
              context,
              title: 'Du lịch Nhật Bản',
              saved: 8000000,
              target: 30000000,
              icon: Icons.flight_takeoff_rounded,
              color: AppColors.peach,
            ),
            SizedBox(height: 20.h),
            _buildSavingJar(
              context,
              title: 'Quỹ dự phòng',
              saved: 50000000,
              target: 50000000,
              icon: Icons.shield_rounded,
              color: AppColors.success,
              isCompleted: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavingJar(
    BuildContext context, {
    required String title,
    required double saved,
    required double target,
    required IconData icon,
    required Color color,
    bool isCompleted = false,
  }) {
    final percent = saved / target;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GlassContainer(
      padding: EdgeInsets.zero,
      gradientColors: isDark ? null : [Colors.white, Colors.white],
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 28.sp),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge?.copyWith(fontSize: 18.sp),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        '${(saved / 1000000).toStringAsFixed(1)}M / ${(target / 1000000).toStringAsFixed(1)}M ₫',
                        style: TextStyle(
                          color: isCompleted
                              ? AppColors.success
                              : Theme.of(context).textTheme.bodyMedium?.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isCompleted)
                  Icon(
                    Icons.check_circle_rounded,
                    color: AppColors.success,
                    size: 28.sp,
                  )
                else
                  Text(
                    '${(percent * 100).toStringAsFixed(0)}%',
                    style: TextStyle(
                      color: color,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
          // "Liquid" fill bar effect
          Container(
            height: 12.h,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withOpacity(0.05)
                  : Colors.grey.shade100,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: FractionallySizedBox(
              widthFactor: percent > 1 ? 1 : percent,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: isCompleted
                      ? const BorderRadius.vertical(bottom: Radius.circular(20))
                      : const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
