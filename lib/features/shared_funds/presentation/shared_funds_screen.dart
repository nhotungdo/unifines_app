import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/glass_container.dart';

class SharedFundsScreen extends StatelessWidget {
  const SharedFundsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tài chính Nhóm'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline_rounded),
            onPressed: () {
              // Create new group modal
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(20.w),
        children: [
          _buildGroupCard(
            context,
            id: '1',
            title: 'Phòng Trọ 201',
            balance: 5500000,
            membersCount: 4,
            myRole: 'Admin',
            color: AppColors.lavender,
          ),
          SizedBox(height: 16.h),
          _buildGroupCard(
            context,
            id: '2',
            title: 'Quỹ Du lịch Phú Quốc',
            balance: 12000000,
            membersCount: 6,
            myRole: 'Thành viên',
            color: AppColors.skyBlue,
          ),
          SizedBox(height: 16.h),
          _buildGroupCard(
            context,
            id: '3',
            title: 'Cà phê cuối tuần',
            balance: -250000, // Âm quỹ
            membersCount: 3,
            myRole: 'Thành viên',
            color: AppColors.peach,
          ),
        ].animate(interval: 150.ms).fade(duration: 500.ms).slideX(begin: -0.1, curve: Curves.easeOutQuad),
      ),
    );
  }

  Widget _buildGroupCard(
    BuildContext context, {
    required String id,
    required String title,
    required double balance,
    required int membersCount,
    required String myRole,
    required Color color,
  }) {
    final isNegative = balance < 0;

    return GestureDetector(
      onTap: () => context.push('/shared-funds/$id'),
      child: GlassContainer(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: color.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Icon(Icons.group_rounded, color: color),
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(fontSize: 18.sp),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Icon(
                              Icons.person_rounded,
                              size: 14.sp,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 4.w),
                            Text(
                              '$membersCount thành viên • $myRole',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(fontSize: 12.sp),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.chevron_right_rounded, color: Colors.grey.shade400),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Số dư quỹ',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  '${(balance / 1000).toStringAsFixed(0)}k ₫',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: isNegative ? AppColors.error : AppColors.success,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
