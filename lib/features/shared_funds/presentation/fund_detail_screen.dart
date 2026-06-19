import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/glass_container.dart';
import '../../../shared/widgets/kawaii_button.dart';

class FundDetailScreen extends ConsumerWidget {
  final String fundId;

  const FundDetailScreen({super.key, required this.fundId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Phòng Trọ 201'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings_rounded),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: AppColors.lavender,
            labelColor: AppColors.lavender,
            unselectedLabelColor: Theme.of(context).textTheme.bodyMedium?.color,
            tabs: const [
              Tab(text: 'Tổng quan'),
              Tab(text: 'Chia tiền'),
            ],
          ),
        ),
        body: TabBarView(
          children: [_buildOverviewTab(context), _buildSplitBillTab(context)],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: AppColors.lavender,
          icon: const Icon(Icons.add_rounded, color: Colors.white),
          label: const Text(
            'Giao dịch',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildOverviewTab(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20.w),
      children: [
        // Balance Card
        GlassContainer(
          gradientColors: [AppColors.lavender, AppColors.skyBlue],
          child: Center(
            child: Column(
              children: [
                Text(
                  'Quỹ hiện tại',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '5.500.000 ₫',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatItem(
                      'Tổng thu',
                      '12M',
                      Icons.arrow_downward_rounded,
                      AppColors.success,
                    ),
                    _buildStatItem(
                      'Tổng chi',
                      '6.5M',
                      Icons.arrow_upward_rounded,
                      AppColors.error,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          'Hoạt động gần đây',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontSize: 18.sp),
        ),
        SizedBox(height: 16.h),
        // Mock Transactions
        _buildTransactionItem(
          context,
          'Đóng quỹ tháng 6',
          'Nguyễn Văn A',
          1500000,
          true,
        ),
        _buildTransactionItem(
          context,
          'Đóng quỹ tháng 6',
          'Trần Thị B',
          1500000,
          true,
        ),
        _buildTransactionItem(
          context,
          'Tiền điện tháng 5',
          'Nguyễn Văn A',
          -850000,
          false,
        ),
      ],
    );
  }

  Widget _buildSplitBillTab(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(20.w),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Yêu cầu chia tiền',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontSize: 18.sp),
            ),
            TextButton(onPressed: () {}, child: const Text('Lịch sử')),
          ],
        ),
        SizedBox(height: 16.h),
        _buildSplitRequestCard(
          context,
          'Tiền Net',
          'Nguyễn Văn A',
          300000,
          4,
          true,
        ),
        SizedBox(height: 12.h),
        _buildSplitRequestCard(
          context,
          'Mua nước mắm',
          'Trần Thị B',
          45000,
          3,
          false,
        ),
      ],
    );
  }

  Widget _buildStatItem(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 16.sp, color: color),
            SizedBox(width: 4.w),
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionItem(
    BuildContext context,
    String title,
    String author,
    double amount,
    bool isIncome,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: isIncome
                ? AppColors.success.withOpacity(0.2)
                : AppColors.error.withOpacity(0.2),
            child: Icon(
              isIncome ? Icons.add_rounded : Icons.remove_rounded,
              color: isIncome ? AppColors.success : AppColors.error,
            ),
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
                  ).textTheme.titleLarge?.copyWith(fontSize: 16.sp),
                ),
                Text(
                  'Bởi: $author',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 12.sp),
                ),
              ],
            ),
          ),
          Text(
            '${isIncome ? '+' : '-'}${amount.abs() / 1000}k',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: isIncome ? AppColors.success : AppColors.error,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSplitRequestCard(
    BuildContext context,
    String title,
    String creator,
    double totalAmount,
    int members,
    bool isMyTurn,
  ) {
    return GlassContainer(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(fontSize: 16.sp),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Tạo bởi $creator',
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 12.sp),
                  ),
                ],
              ),
              Text(
                '${totalAmount / 1000}k',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Phần của bạn: ${(totalAmount / members / 1000).toStringAsFixed(0)}k',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.lavender,
                ),
              ),
              if (isMyTurn)
                SizedBox(
                  height: 36.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lavender,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Thanh toán',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              else
                const Text(
                  'Đã thanh toán',
                  style: TextStyle(color: AppColors.success),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
