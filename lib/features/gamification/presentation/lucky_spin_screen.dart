import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/kawaii_button.dart';

class LuckySpinScreen extends StatefulWidget {
  const LuckySpinScreen({super.key});

  @override
  State<LuckySpinScreen> createState() => _LuckySpinScreenState();
}

class _LuckySpinScreenState extends State<LuckySpinScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _spinController;
  bool _isSpinning = false;
  double _rotation = 0.0;

  @override
  void initState() {
    super.initState();
    _spinController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _spinController.addListener(() {
      setState(() {
        _rotation = _spinController.value * 2 * pi * 5; // Spin 5 times
      });
    });
    _spinController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isSpinning = false;
        });
        _showResultDialog();
      }
    });
  }

  @override
  void dispose() {
    _spinController.dispose();
    super.dispose();
  }

  void _spin() {
    if (_isSpinning) return;
    setState(() {
      _isSpinning = true;
    });
    _spinController.forward(from: 0.0);
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Center(
          child: Text(
            '🎉 Chúc mừng!',
            style: TextStyle(
              color: AppColors.success,
              fontWeight: FontWeight.bold,
              fontSize: 24.sp,
            ),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.monetization_on_rounded,
              color: AppColors.warning,
              size: 80.sp,
            ).animate().scale(duration: 500.ms, curve: Curves.elasticOut),
            SizedBox(height: 16.h),
            Text(
              'Bạn trúng được 50 Unicoin!',
              style: TextStyle(fontSize: 18.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: [
          Center(
            child: KawaiiButton(
              text: 'Nhận ngay',
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vòng quay May mắn')),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Text(
              'Thử vận may hôm nay!',
              style: Theme.of(
                context,
              ).textTheme.displayLarge?.copyWith(fontSize: 28.sp),
            ),
            Text(
              'Tốn 10 Unicoin mỗi lần quay',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Spacer(),
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: _rotation,
                  child: Container(
                    width: 300.w,
                    height: 300.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: SweepGradient(
                        colors: [
                          AppColors.mint,
                          AppColors.skyBlue,
                          AppColors.lavender,
                          AppColors.peach,
                          AppColors.lemon,
                          AppColors.mint, // loop back
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.mint.withOpacity(0.5),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Container(
                        width: 260.w,
                        height: 260.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        // Replace with actual segmented wheel if needed
                        child: Icon(
                          Icons.star_rounded,
                          size: 100.sp,
                          color: AppColors.warning.withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                ),
                // Indicator Arrow
                Positioned(
                  top: 0,
                  child: Icon(
                    Icons.arrow_drop_down_rounded,
                    color: AppColors.error,
                    size: 60.sp,
                  ),
                ),
              ],
            ),
            Spacer(),
            KawaiiButton(
                  text: _isSpinning ? 'Đang quay...' : 'Quay ngay',
                  onPressed: _spin,
                  icon: Icons.refresh_rounded,
                )
                .animate(target: _isSpinning ? 0 : 1)
                .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1)),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
