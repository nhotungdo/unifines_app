import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/glass_container.dart';

class TasksChallengesScreen extends StatelessWidget {
  const TasksChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Nhiệm vụ & Thử thách'),
          actions: [
            GestureDetector(
              onTap: () => context.push('/rewards'),
              child: Container(
                margin: EdgeInsets.only(right: 16.w),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.lemon.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.monetization_on_rounded,
                      color: AppColors.warning,
                      size: 20.sp,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      '1.250',
                      style: TextStyle(
                        color: AppColors.warning,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          bottom: TabBar(
            indicatorColor: AppColors.mint,
            labelColor: AppColors.mint,
            unselectedLabelColor: Theme.of(context).textTheme.bodyMedium?.color,
            tabs: const [
              Tab(text: 'Nhiệm vụ Ngày'),
              Tab(text: 'Thử thách Tuần'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildDailyTasks(context),
            _buildWeeklyChallenges(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyTasks(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20.w),
      children: [
        _buildTaskCard(
          context,
          title: 'Nhập 1 giao dịch chi tiêu',
          reward: 10,
          isCompleted: true,
        ),
        SizedBox(height: 12.h),
        _buildTaskCard(
          context,
          title: 'Mở ứng dụng',
          reward: 5,
          isCompleted: true,
        ),
        SizedBox(height: 12.h),
        _buildTaskCard(
          context,
          title: 'Sử dụng trợ lý giọng nói',
          reward: 20,
          isCompleted: false,
        ),
      ],
    );
  }

  Widget _buildWeeklyChallenges(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20.w),
      children: [
        _buildTaskCard(
          context,
          title: 'Không vượt quá ngân sách ăn uống tuần này',
          reward: 100,
          isCompleted: false,
          progress: 5,
          total: 7, // Days
        ),
        SizedBox(height: 12.h),
        _buildTaskCard(
          context,
          title: 'Nhập giao dịch 7 ngày liên tiếp',
          reward: 50,
          isCompleted: false,
          progress: 3,
          total: 7,
        ),
      ],
    );
  }

  Widget _buildTaskCard(
    BuildContext context, {
    required String title,
    required int reward,
    required bool isCompleted,
    int? progress,
    int? total,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GlassContainer(
      padding: EdgeInsets.all(16.w),
      gradientColors: isCompleted && !isDark
          ? [Colors.green.shade50, Colors.white]
          : null,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: isCompleted
                  ? AppColors.success
                  : AppColors.lemon.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isCompleted ? Icons.check_rounded : Icons.star_rounded,
              color: isCompleted ? Colors.white : AppColors.warning,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 16.sp,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                if (progress != null && total != null && !isCompleted) ...[
                  SizedBox(height: 8.h),
                  LinearProgressIndicator(
                    value: progress / total,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      AppColors.mint,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '$progress / $total ngày',
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            children: [
              Text(
                '+$reward',
                style: TextStyle(
                  color: AppColors.warning,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),
              Icon(
                Icons.monetization_on_rounded,
                color: AppColors.warning,
                size: 16.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
