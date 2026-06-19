import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/glass_container.dart';

class BudgetPlannerScreen extends StatelessWidget {
  const BudgetPlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quản lý Ngân sách')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOverallBudget(context),
            SizedBox(height: 24.h),
            Text(
              'Ngân sách từng danh mục',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontSize: 20.sp),
            ),
            SizedBox(height: 16.h),
            _buildCategoryBudget(
              context,
              'Ăn uống',
              Icons.restaurant_rounded,
              4500000,
              5000000,
            ),
            _buildCategoryBudget(
              context,
              'Di chuyển',
              Icons.directions_car_rounded,
              1200000,
              1500000,
            ),
            _buildCategoryBudget(
              context,
              'Mua sắm',
              Icons.shopping_bag_rounded,
              3500000,
              3000000,
            ), // Over budget
          ].animate(interval: 100.ms).fade(duration: 400.ms).slideY(begin: 0.1, curve: Curves.easeOutQuad),
        ),
      ),
    );
  }

  Widget _buildOverallBudget(BuildContext context) {
    return GlassContainer(
      gradientColors: [
        AppColors.mint.withOpacity(0.8),
        AppColors.skyBlue.withOpacity(0.8),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ngân sách tháng 6',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '9.200.000 ₫ / 10.000.000 ₫',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.92,
              minHeight: 12.h,
              backgroundColor: Colors.white.withOpacity(0.3),
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Còn lại 800.000 ₫ (8 ngày)',
            style: TextStyle(color: Colors.white, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryBudget(
    BuildContext context,
    String title,
    IconData icon,
    double spent,
    double total,
  ) {
    final percent = spent / total;

    // Change color based on threshold
    Color progressColor = AppColors.success;
    if (percent > 0.9) {
      progressColor = AppColors.error;
    } else if (percent > 0.7) {
      progressColor = AppColors.warning;
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: isDark
            ? null
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: progressColor.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: progressColor, size: 20.sp),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontSize: 16.sp),
                ),
              ),
              Text(
                '${(spent / 1000).toStringAsFixed(0)}k / ${(total / 1000).toStringAsFixed(0)}k',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: progressColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: percent > 1.0 ? 1.0 : percent,
              minHeight: 8.h,
              backgroundColor: isDark
                  ? Colors.white.withOpacity(0.1)
                  : Colors.grey.shade200,
              valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            ),
          ),
          if (percent > 1.0) ...[
            SizedBox(height: 8.h),
            Text(
              '⚠️ Đã vượt ngân sách!',
              style: TextStyle(
                color: AppColors.error,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
