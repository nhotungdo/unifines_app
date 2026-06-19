import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/glass_container.dart';

class DebtManagementScreen extends StatelessWidget {
  const DebtManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quản lý Nợ & Cho vay'),
          bottom: TabBar(
            indicatorColor: AppColors.mint,
            labelColor: AppColors.mint,
            unselectedLabelColor: Theme.of(context).textTheme.bodyMedium?.color,
            tabs: const [
              Tab(text: 'Khoản nợ'),
              Tab(text: 'Cho vay'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildDebtList(context, isDebt: true),
            _buildDebtList(context, isDebt: false),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: AppColors.mint,
          icon: const Icon(Icons.add_rounded, color: Colors.white),
          label: const Text(
            'Thêm khoản mới',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildDebtList(BuildContext context, {required bool isDebt}) {
    return ListView(
      padding: EdgeInsets.all(20.w),
      children: [
        _buildDebtCard(
          context,
          person: isDebt ? 'Ngân hàng VCB' : 'Minh Khang',
          amount: isDebt ? 50000000 : 2000000,
          dueDate: '15/07/2026',
          paid: isDebt ? 10000000 : 0,
          isDebt: isDebt,
        ),
        SizedBox(height: 16.h),
        if (isDebt)
          _buildDebtCard(
            context,
            person: 'Mẹ',
            amount: 5000000,
            dueDate: 'Không kỳ hạn',
            paid: 5000000,
            isDebt: true,
          ),
      ],
    );
  }

  Widget _buildDebtCard(
    BuildContext context, {
    required String person,
    required double amount,
    required String dueDate,
    required double paid,
    required bool isDebt,
  }) {
    final isCompleted = paid >= amount;
    final primaryColor = isCompleted
        ? AppColors.success
        : (isDebt ? AppColors.error : AppColors.info);

    return GlassContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: primaryColor.withOpacity(0.2),
                    child: Icon(
                      isDebt
                          ? Icons.account_balance_rounded
                          : Icons.person_rounded,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        person,
                        style: Theme.of(
                          context,
                        ).textTheme.titleLarge?.copyWith(fontSize: 16.sp),
                      ),
                      Text(
                        isDebt ? 'Bạn nợ' : 'Nợ bạn',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ],
              ),
              if (isCompleted)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Đã xong',
                    style: TextStyle(
                      color: AppColors.success,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                )
              else
                Text(
                  'Hạn: $dueDate',
                  style: TextStyle(
                    color: AppColors.warning,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tổng tiền', style: Theme.of(context).textTheme.bodyMedium),
              Text(
                '${(amount / 1000000).toStringAsFixed(1)}M ₫',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.displayLarge?.color,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          LinearProgressIndicator(
            value: paid / amount,
            backgroundColor: primaryColor.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
            borderRadius: BorderRadius.circular(4),
          ),
          SizedBox(height: 8.h),
          Text(
            'Đã trả: ${(paid / 1000000).toStringAsFixed(1)}M ₫',
            style: TextStyle(
              color: primaryColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
