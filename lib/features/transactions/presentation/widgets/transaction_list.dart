import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/transaction_provider.dart';
import '../../domain/transaction_model.dart';

class TransactionList extends ConsumerWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionAsync = ref.watch(transactionProvider);

    return transactionAsync.when(
      data: (transactions) {
        if (transactions.isEmpty) {
          return const Center(child: Text('Chưa có giao dịch nào'));
        }
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: transactions.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final tx = transactions[index];
            final isIncome = tx.type == TransactionType.income;

            // Map icon based on category/type
            IconData icon = isIncome
                ? Icons.account_balance_wallet_rounded
                : Icons.shopping_bag_rounded;
            Color color = isIncome ? AppColors.success : AppColors.peach;
            if (tx.category.toLowerCase().contains('ăn')) {
              icon = Icons.fastfood_rounded;
              color = AppColors.lemon;
            }

            return Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.05)
                    : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: Theme.of(context).brightness == Brightness.light
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.02),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: color)
                        .animate(onPlay: (c) => c.repeat(reverse: true))
                        .scaleXY(end: 1.1, duration: 2.seconds),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tx.title,
                          style: Theme.of(
                            context,
                          ).textTheme.titleLarge?.copyWith(fontSize: 16.sp),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          '${tx.date.day}/${tx.date.month} • ${tx.category}',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(fontSize: 12.sp),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${isIncome ? '+' : '-'}${(tx.amount / 1000).toStringAsFixed(0)}k ₫',
                    style: TextStyle(
                      color: isIncome
                          ? AppColors.success
                          : Theme.of(context).textTheme.displayLarge?.color,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ).animate().fade(duration: 500.ms, delay: (index * 100).ms).slideX(begin: 0.1, curve: Curves.easeOutQuad);
          },
        );
      },
      loading: () =>
          const Center(child: CircularProgressIndicator(color: AppColors.mint)),
      error: (e, st) => Center(child: Text('Lỗi tải dữ liệu')),
    );
  }
}
