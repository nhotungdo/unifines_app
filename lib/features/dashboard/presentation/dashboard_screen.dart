import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/glass_container.dart';
import '../../transactions/presentation/widgets/wallets_carousel.dart';
import '../../transactions/presentation/widgets/transaction_list.dart';
import '../../planning/presentation/budget_planner_screen.dart';
import '../../planning/presentation/savings_goals_screen.dart';
import '../../planning/presentation/debt_management_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(child: _buildBody()),
      bottomNavigationBar: _buildBottomNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showQuickEntryOptions(context);
        },
        backgroundColor: AppColors.mint,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _showQuickEntryOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Tạo giao dịch',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontSize: 20.sp),
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildQuickEntryBtn(
                  context,
                  Icons.mic_rounded,
                  'Giọng nói',
                  AppColors.skyBlue,
                  () {
                    Navigator.pop(context);
                    context.push('/voice-input');
                  },
                ),
                _buildQuickEntryBtn(
                  context,
                  Icons.receipt_long_rounded,
                  'Quét hóa đơn',
                  AppColors.lavender,
                  () {
                    Navigator.pop(context);
                    context.push('/scanner');
                  },
                ),
                _buildQuickEntryBtn(
                  context,
                  Icons.edit_note_rounded,
                  'Thủ công',
                  AppColors.mint,
                  () {
                    Navigator.pop(context);
                    // context.push('/manual-entry');
                  },
                ),
              ],
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickEntryBtn(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 32.sp),
          ),
          SizedBox(height: 8.h),
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }

  Widget _buildQuickAction(
    BuildContext context,
    IconData icon,
    String label,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: color, size: 28.sp),
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return _buildHomeTab();
      case 1:
        return const BudgetPlannerScreen();
      case 3:
        return const SavingsGoalsScreen();
      case 4:
        return const DebtManagementScreen();
      default:
        return _buildHomeTab();
    }
  }

  Widget _buildHomeTab() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader().animate().fade(duration: 500.ms).slideY(begin: -0.2, curve: Curves.easeOutBack),
                SizedBox(height: 24.h),
                _buildHeroBalance().animate().fade(delay: 200.ms, duration: 500.ms).scaleXY(begin: 0.9, curve: Curves.easeOutBack),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildQuickAction(
                      context,
                      Icons.swap_horiz_rounded,
                      'Chuyển tiền',
                      AppColors.skyBlue,
                      () {},
                    ),
                    _buildQuickAction(
                      context,
                      Icons.account_balance_wallet_rounded,
                      'Nạp tiền',
                      AppColors.mint,
                      () {},
                    ),
                    _buildQuickAction(
                      context,
                      Icons.group_rounded,
                      'Quỹ nhóm',
                      AppColors.lavender,
                      () {
                        context.push('/shared-funds');
                      },
                    ),
                    _buildQuickAction(
                      context,
                      Icons.more_horiz_rounded,
                      'Thêm',
                      AppColors.peach,
                      () {},
                    ),
                  ].animate(interval: 100.ms).fade(duration: 400.ms).slideY(begin: 0.2, curve: Curves.easeOutBack),
                ),
                SizedBox(height: 24.h),
                Text(
                  'Ví của bạn',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontSize: 20.sp),
                ),
                SizedBox(height: 12.h),
                const WalletsCarousel(),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Giao dịch gần đây',
                      style: Theme.of(
                        context,
                      ).textTheme.titleLarge?.copyWith(fontSize: 20.sp),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Xem tất cả',
                        style: TextStyle(color: AppColors.skyBlue),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                const TransactionList(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chào buổi sáng,',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Nguyễn Văn A',
              style: Theme.of(
                context,
              ).textTheme.displayLarge?.copyWith(fontSize: 24.sp),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => context.push('/tasks'),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.lemon.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.monetization_on_rounded,
                      color: AppColors.warning,
                      size: 18.sp,
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
            SizedBox(width: 12.w),
            CircleAvatar(
              radius: 24.r,
              backgroundColor: AppColors.lavender.withOpacity(0.5),
              backgroundImage: const NetworkImage(
                'https://i.pravatar.cc/150?img=12',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroBalance() {
    return GlassContainer(
      padding: EdgeInsets.all(24.w),
      gradientColors: [
        AppColors.mint.withOpacity(0.8),
        AppColors.skyBlue.withOpacity(0.8),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tổng số dư',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '24.500.000 ₫',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              _buildBalanceStat(
                Icons.arrow_downward_rounded,
                'Thu nhập',
                '15.000.000 ₫',
              ),
              SizedBox(width: 24.w),
              _buildBalanceStat(
                Icons.arrow_upward_rounded,
                'Chi tiêu',
                '4.200.000 ₫',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceStat(IconData icon, String label, String amount) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(4.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 16.sp),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12.sp,
              ),
            ),
            Text(
              amount,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        if (index != 2) {
          setState(() => _currentIndex = index);
        }
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      selectedItemColor: AppColors.mint,
      unselectedItemColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white54
          : Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded),
          label: 'Tổng quan',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pie_chart_rounded),
          label: 'Ngân sách',
        ),
        BottomNavigationBarItem(
          icon: SizedBox.shrink(),
          label: '',
        ), // Spacer for FAB
        BottomNavigationBarItem(
          icon: Icon(Icons.savings_rounded),
          label: 'Tiết kiệm',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_rounded),
          label: 'Nợ',
        ),
      ],
    );
  }
}
